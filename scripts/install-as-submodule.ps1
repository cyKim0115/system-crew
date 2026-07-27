# Install system-crew as a git submodule into a consumer project.
# Usage (from consumer project root):
#   powershell -File <path-to>/install-as-submodule.ps1
#   powershell -File <path-to>/install-as-submodule.ps1 -CrewUrl git@github.com:you/system-crew.git

param(
    [string]$CrewUrl = "",
    [string]$TargetPath = ".cursor/system-crew"
)

$ErrorActionPreference = "Stop"
$ProjectRoot = (Get-Location).Path

if (-not (Test-Path (Join-Path $ProjectRoot ".git"))) {
    throw "Run this from a git repository root."
}

if (-not $CrewUrl) {
    $sibling = Join-Path $ProjectRoot "../system-crew"
    if (Test-Path (Join-Path $sibling ".git")) {
        $CrewUrl = (Resolve-Path $sibling).Path -replace '\\', '/'
        Write-Host "Using local sibling repo: $CrewUrl"
    } else {
        throw "Pass -CrewUrl (git remote) or place system-crew as a sibling folder ../system-crew"
    }
}

New-Item -ItemType Directory -Force -Path (Join-Path $ProjectRoot ".cursor") | Out-Null

if (Test-Path (Join-Path $ProjectRoot $TargetPath)) {
    Write-Host "Target already exists: $TargetPath — skipping submodule add"
} else {
    # Local file:// / absolute paths need protocol.file.allow (one-shot, no global config write)
    git -c protocol.file.allow=always submodule add --force $CrewUrl $TargetPath
}

git -c protocol.file.allow=always submodule update --init --recursive
$sync = Join-Path $ProjectRoot "$TargetPath/scripts/sync-to-project.ps1"
& powershell.exe -NoProfile -File $sync -ProjectRoot $ProjectRoot

Write-Host "Done. Commit .gitmodules, $TargetPath, .cursor/rules, and AGENTS.md when ready."
