# system-crew → project sync
# Copies Cursor rules from the submodule into the consuming project's .cursor/rules/
# Does NOT touch .cursor/rules/local/ (project-specific overrides).

param(
    [string]$ProjectRoot = ""
)

$ErrorActionPreference = "Stop"

if (-not $ProjectRoot) {
    # scripts/ is at <submodule>/scripts → submodule root is parent
    $crewRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
    # submodule expected at <project>/.cursor/system-crew
    $ProjectRoot = Resolve-Path (Join-Path $crewRoot "../..")
} else {
    $ProjectRoot = Resolve-Path $ProjectRoot
    $crewRoot = Join-Path $ProjectRoot ".cursor/system-crew"
    if (-not (Test-Path $crewRoot)) {
        # Allow running from the system-crew repo itself for dry checks
        $crewRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
    }
}

$srcRules = Join-Path $crewRoot "cursor/rules"
$dstRules = Join-Path $ProjectRoot ".cursor/rules"
$localRules = Join-Path $dstRules "local"
$stamp = Join-Path $dstRules ".system-crew-sync.json"

if (-not (Test-Path $srcRules)) {
    throw "Source rules not found: $srcRules"
}

New-Item -ItemType Directory -Force -Path $dstRules | Out-Null
New-Item -ItemType Directory -Force -Path $localRules | Out-Null

# Remove previously synced system-crew-* rules only
Get-ChildItem $dstRules -Filter "system-crew*.mdc" -File -ErrorAction SilentlyContinue | Remove-Item -Force
Get-ChildItem $dstRules -Filter "role-*.mdc" -File -ErrorAction SilentlyContinue | Where-Object {
    $_.Name -match '^role-(producer|systems-analyst|implementer|fidelity-qa)\.mdc$'
} | Remove-Item -Force

Copy-Item (Join-Path $srcRules "*.mdc") $dstRules -Force

# Ensure AGENTS.md pointer exists or refresh the system-crew section (UTF-8, no BOM)
$utf8 = New-Object System.Text.UTF8Encoding $false
function Read-Utf8Text([string]$Path) {
    return [System.IO.File]::ReadAllText($Path, $utf8)
}
function Write-Utf8Text([string]$Path, [string]$Text) {
    [System.IO.File]::WriteAllText($Path, $Text, $utf8)
}

$agentsPath = Join-Path $ProjectRoot "AGENTS.md"
$bannerStart = "<!-- system-crew:start -->"
$bannerEnd = "<!-- system-crew:end -->"
$section = @"
$bannerStart
# system-crew

Shared 4-role pack (submodule: `.cursor/system-crew`).

- Update pack: `git submodule update --remote .cursor/system-crew`
- Refresh Cursor rules: `powershell -File .cursor/system-crew/scripts/sync-to-project.ps1`
- Workflow: `.cursor/system-crew/workflows/from-reference.md`
- Roles: Producer → Systems Analyst → Implementer → Fidelity QA

Project-only overrides: `.cursor/rules/local/`
$bannerEnd
"@

if (Test-Path $agentsPath) {
    $existing = Read-Utf8Text $agentsPath
    if ($existing -match [regex]::Escape($bannerStart)) {
        $updated = [regex]::Replace($existing, "(?s)" + [regex]::Escape($bannerStart) + ".*?" + [regex]::Escape($bannerEnd), $section.TrimEnd())
        Write-Utf8Text $agentsPath $updated
    } else {
        Write-Utf8Text $agentsPath ($existing.TrimEnd() + "`r`n`r`n" + $section.TrimEnd() + "`r`n")
    }
} else {
    $fromCrew = Read-Utf8Text (Join-Path $crewRoot "AGENTS.md")
    Write-Utf8Text $agentsPath ($fromCrew.TrimEnd() + "`r`n`r`n" + $section.TrimEnd() + "`r`n")
}

$versionFile = Join-Path $crewRoot "VERSION"
$version = if (Test-Path $versionFile) { (Read-Utf8Text $versionFile).Trim() } else { "unknown" }
$meta = @{
    syncedAt = (Get-Date).ToString("o")
    version  = $version
    crewPath = ".cursor/system-crew"
} | ConvertTo-Json
Write-Utf8Text $stamp $meta

Write-Host "Synced system-crew $version rules → $dstRules"
Write-Host "Local overrides preserved under $localRules"
