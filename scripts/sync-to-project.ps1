# system-crew → project sync
# Copies Cursor rules from the submodule into the consuming project's .cursor/rules/
# Does NOT touch .cursor/rules/local/ (project-specific overrides).

param(
    [string]$ProjectRoot = "",
    # Always  = rules keep upstream alwaysApply (default for full adoption)
    # OnDemand = force alwaysApply:false + install invoke skill (call to use)
    [ValidateSet("Always", "OnDemand")]
    [string]$Mode = "Always"
)

$ErrorActionPreference = "Stop"
$utf8 = New-Object System.Text.UTF8Encoding $false

function Read-Utf8Text([string]$Path) {
    return [System.IO.File]::ReadAllText($Path, $utf8)
}
function Write-Utf8Text([string]$Path, [string]$Text) {
    [System.IO.File]::WriteAllText($Path, $Text, $utf8)
}

if (-not $ProjectRoot) {
    $crewRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
    $ProjectRoot = Resolve-Path (Join-Path $crewRoot "../..")
} else {
    $ProjectRoot = Resolve-Path $ProjectRoot
    $crewRoot = Join-Path $ProjectRoot ".cursor/system-crew"
    if (-not (Test-Path $crewRoot)) {
        $crewRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
    }
}

$srcRules = Join-Path $crewRoot "cursor/rules"
$srcSkill = Join-Path $crewRoot "cursor/skills/system-crew/SKILL.md"
$dstRules = Join-Path $ProjectRoot ".cursor/rules"
$dstSkillDir = Join-Path $ProjectRoot ".cursor/skills/system-crew"
$localRules = Join-Path $dstRules "local"
$stamp = Join-Path $dstRules ".system-crew-sync.json"
$modeFile = Join-Path $dstRules ".system-crew-mode"

if (-not (Test-Path $srcRules)) {
    throw "Source rules not found: $srcRules"
}

New-Item -ItemType Directory -Force -Path $dstRules | Out-Null
New-Item -ItemType Directory -Force -Path $localRules | Out-Null

# Remove previously synced pack-owned rule files
Get-ChildItem $dstRules -Filter "system-crew*.mdc" -File -ErrorAction SilentlyContinue | Remove-Item -Force
Get-ChildItem $dstRules -Filter "role-*.mdc" -File -ErrorAction SilentlyContinue | Where-Object {
    $_.Name -match '^role-(producer|systems-analyst|implementer|fidelity-qa|idea-evaluation)\.mdc$'
} | Remove-Item -Force

Get-ChildItem (Join-Path $srcRules "*.mdc") | ForEach-Object {
    $text = Read-Utf8Text $_.FullName
    if ($Mode -eq "OnDemand") {
        if ($text -match '(?m)^alwaysApply:\s*true\s*$') {
            $text = [regex]::Replace($text, '(?m)^alwaysApply:\s*true\s*$', 'alwaysApply: false')
        } elseif ($text -match '(?m)^---\s*$' -and $text -notmatch '(?m)^alwaysApply:') {
            # insert alwaysApply false after first frontmatter line block start
            $text = [regex]::Replace($text, '(?s)^(---\r?\n)', "`$1alwaysApply: false`r`n", 1)
        }
    }
    Write-Utf8Text (Join-Path $dstRules $_.Name) $text
}

# OnDemand: install invoke skill; Always: remove stale invoke skill if present from prior OnDemand
if ($Mode -eq "OnDemand") {
    if (-not (Test-Path $srcSkill)) {
        throw "OnDemand skill missing: $srcSkill"
    }
    New-Item -ItemType Directory -Force -Path $dstSkillDir | Out-Null
    Copy-Item $srcSkill (Join-Path $dstSkillDir "SKILL.md") -Force
} else {
    if (Test-Path $dstSkillDir) {
        Remove-Item $dstSkillDir -Recurse -Force
    }
}

Write-Utf8Text $modeFile $Mode

$bannerStart = "<!-- system-crew:start -->"
$bannerEnd = "<!-- system-crew:end -->"

if ($Mode -eq "OnDemand") {
    $section = @"
$bannerStart
# system-crew (on-demand)

참고→시스템 구현 팩이 **호출형**으로 설치되어 있다. 평소 워크플로에는 끼어들지 않는다.

## 호출 방법

- `system-crew` / `시스템 크루` / `Producer로` / `참고 재현` / `아이디어 평가해줘` 라고 명시
- 또는 Cursor Skill: `system-crew`

## Paths

- Submodule: `.cursor/system-crew`
- Sync: `powershell -File .cursor/system-crew/scripts/sync-to-project.ps1 -Mode OnDemand`
- Docs (when used): `docs/references/`, `docs/decisions/ideas/`
$bannerEnd
"@
} else {
    $section = @"
$bannerStart
# system-crew

Shared 4-role pack (submodule: `.cursor/system-crew`).

- Update pack: `git submodule update --remote .cursor/system-crew`
- Refresh Cursor rules: `powershell -File .cursor/system-crew/scripts/sync-to-project.ps1`
- Workflow: `.cursor/system-crew/workflows/from-reference.md`
- Idea evaluation: `.cursor/system-crew/workflows/idea-evaluation.md`
- Roles: Producer → Systems Analyst → Implementer → Fidelity QA

Project-only overrides: `.cursor/rules/local/`
$bannerEnd
"@
}

# Prefer root AGENTS.md; for OnDemand also allow .agents/AGENTS.md without creating a new root file
$agentsCandidates = @(
    (Join-Path $ProjectRoot "AGENTS.md")
)
if ($Mode -eq "OnDemand") {
    $agentsCandidates += (Join-Path $ProjectRoot ".agents/AGENTS.md")
}

$agentsPath = $null
foreach ($c in $agentsCandidates) {
    if (Test-Path $c) { $agentsPath = $c; break }
}

if ($Mode -eq "Always") {
    if (-not $agentsPath) {
        $agentsPath = Join-Path $ProjectRoot "AGENTS.md"
        $fromCrew = Read-Utf8Text (Join-Path $crewRoot "AGENTS.md")
        Write-Utf8Text $agentsPath ($fromCrew.TrimEnd() + "`r`n`r`n" + $section.TrimEnd() + "`r`n")
    } else {
        $existing = Read-Utf8Text $agentsPath
        if ($existing -match [regex]::Escape($bannerStart)) {
            $updated = [regex]::Replace($existing, "(?s)" + [regex]::Escape($bannerStart) + ".*?" + [regex]::Escape($bannerEnd), $section.TrimEnd())
            Write-Utf8Text $agentsPath $updated
        } else {
            Write-Utf8Text $agentsPath ($existing.TrimEnd() + "`r`n`r`n" + $section.TrimEnd() + "`r`n")
        }
    }
} elseif ($agentsPath) {
    # OnDemand: only refresh banner if already present; do not append to huge migrated AGENTS dumps
    $existing = Read-Utf8Text $agentsPath
    if ($existing -match [regex]::Escape($bannerStart)) {
        $updated = [regex]::Replace($existing, "(?s)" + [regex]::Escape($bannerStart) + ".*?" + [regex]::Escape($bannerEnd), $section.TrimEnd())
        Write-Utf8Text $agentsPath $updated
    }
    # write lightweight usage note instead of polluting AGENTS
    Write-Utf8Text (Join-Path $ProjectRoot ".cursor/SYSTEM-CREW.md") @"
# system-crew (on-demand)

이 프로젝트에서는 system-crew가 **상시 적용되지 않는다**. 필요할 때만 호출한다.

## 호출

- 채팅: `system-crew`, `시스템 크루`, `Producer로`, `참고 재현해줘`, `아이디어 평가해줘`
- Skill: `.cursor/skills/system-crew`

## 업데이트

``````powershell
git submodule update --remote .cursor/system-crew
powershell -File .cursor/system-crew/scripts/sync-to-project.ps1 -Mode OnDemand
``````
"@
}

$versionFile = Join-Path $crewRoot "VERSION"
$version = if (Test-Path $versionFile) { (Read-Utf8Text $versionFile).Trim() } else { "unknown" }
$meta = @{
    syncedAt = (Get-Date).ToString("o")
    version  = $version
    crewPath = ".cursor/system-crew"
    mode     = $Mode
} | ConvertTo-Json
Write-Utf8Text $stamp $meta

Write-Host "Synced system-crew $version ($Mode) → $dstRules"
Write-Host "Local overrides preserved under $localRules"
