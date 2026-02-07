# Content Factory x Second Brain — Install Script
# Usage: .\install.ps1

param(
    [string]$VaultPath = "",
    [string]$AgentPath = "",
    [string]$Mode = ""
)

Write-Host ""
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host "  Content Factory x Second Brain" -ForegroundColor Cyan
Write-Host "  Install Script v1.0" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Step 1: Ask for paths
if (-not $AgentPath) {
    $AgentPath = Read-Host "Nhap duong dan Antigravity Agent (Vi du: D:\Antigravity Agent)"
}
if (-not $VaultPath) {
    $VaultPath = Read-Host "Nhap duong dan Obsidian Vault (Vi du: C:\Obsidian\MyVault)"
}

# Validate paths
if (-not (Test-Path $AgentPath)) {
    Write-Host "ERROR: Khong tim thay thu muc Antigravity Agent: $AgentPath" -ForegroundColor Red
    exit 1
}

# Step 2: Copy engine + standards + bridge to knowledge
$destKnowledge = Join-Path $AgentPath "knowledge\content-factory"
Write-Host "`n[1/5] Copying engine, standards, bridge..." -ForegroundColor Yellow

$dirs = @("engine", "standards", "obsidian-bridge")
foreach ($dir in $dirs) {
    $src = Join-Path $scriptDir $dir
    $dst = Join-Path $destKnowledge $dir
    if (Test-Path $src) {
        New-Item -ItemType Directory -Force -Path $dst | Out-Null
        Copy-Item "$src\*" $dst -Recurse -Force
        Write-Host "  OK: $dir" -ForegroundColor Green
    }
}

# Step 3: Copy personas
Write-Host "`n[2/5] Copying personas..." -ForegroundColor Yellow
$personasSrc = Join-Path $scriptDir "personas"
$personasDst = Join-Path $destKnowledge "personas"
New-Item -ItemType Directory -Force -Path $personasDst | Out-Null
Copy-Item "$personasSrc\*" $personasDst -Recurse -Force
Write-Host "  OK: personas (_template + thong-phan)" -ForegroundColor Green

# Step 4: Copy workflows
Write-Host "`n[3/5] Copying workflows..." -ForegroundColor Yellow
$workflowsSrc = Join-Path $scriptDir "workflows"
$workflowsDst = Join-Path $AgentPath ".agent\workflows"
if (Test-Path $workflowsSrc) {
    Get-ChildItem $workflowsSrc -File | ForEach-Object {
        Copy-Item $_.FullName $workflowsDst -Force
        Write-Host "  OK: $($_.Name)" -ForegroundColor Green
    }
}

# Step 5: Copy samples
Write-Host "`n[4/5] Copying samples..." -ForegroundColor Yellow
$samplesSrc = Join-Path $scriptDir "samples"
$samplesDst = Join-Path $destKnowledge "samples"
New-Item -ItemType Directory -Force -Path $samplesDst | Out-Null
Copy-Item "$samplesSrc\*" $samplesDst -Recurse -Force
Write-Host "  OK: samples" -ForegroundColor Green

# Step 6: Setup vault
Write-Host "`n[5/5] Setting up Second Brain vault..." -ForegroundColor Yellow
if (-not $Mode) {
    Write-Host ""
    Write-Host "Chon che do:" -ForegroundColor Cyan
    Write-Host "  A - Dung DNA Thong Phan (co ngay stories + standards)"
    Write-Host "  B - Tao DNA rieng (template trong, ban tu dien)"
    Write-Host ""
    $Mode = Read-Host "Chon A hoac B"
}

# Create vault structure
$vaultTemplateSrc = Join-Path $scriptDir "vault-template"
if (Test-Path $VaultPath) {
    Get-ChildItem $vaultTemplateSrc -Directory -Recurse | ForEach-Object {
        $relPath = $_.FullName.Substring($vaultTemplateSrc.Length)
        $dstDir = Join-Path $VaultPath $relPath
        New-Item -ItemType Directory -Force -Path $dstDir | Out-Null
    }
    Write-Host "  OK: Cau truc vault da tao" -ForegroundColor Green
} else {
    New-Item -ItemType Directory -Force -Path $VaultPath | Out-Null
    Get-ChildItem $vaultTemplateSrc -Directory -Recurse | ForEach-Object {
        $relPath = $_.FullName.Substring($vaultTemplateSrc.Length)
        $dstDir = Join-Path $VaultPath $relPath
        New-Item -ItemType Directory -Force -Path $dstDir | Out-Null
    }
    Write-Host "  OK: Vault moi da tao tai $VaultPath" -ForegroundColor Green
}

if ($Mode -eq "A" -or $Mode -eq "a") {
    # Copy sample stories
    $storiesSrc = Join-Path $scriptDir "vault-sample\01-Atomic\Stories"
    $storiesDst = Join-Path $VaultPath "01-Atomic\Stories"
    New-Item -ItemType Directory -Force -Path $storiesDst | Out-Null
    Copy-Item "$storiesSrc\*" $storiesDst -Force
    Write-Host "  OK: 24 stories Thong Phan da copy vao vault" -ForegroundColor Green
    Write-Host ""
    Write-Host "HOAN TAT! Ban co the bat dau viet bai ngay voi /content-post" -ForegroundColor Green
} else {
    Write-Host "  OK: Vault trong da san sang" -ForegroundColor Green
    Write-Host ""
    Write-Host "HOAN TAT! Tiep theo:" -ForegroundColor Green
    Write-Host "  1. Chay /onboarding-persona de tao DNA rieng" -ForegroundColor Yellow
    Write-Host "  2. Ke 10+ cau chuyen qua /story-bank" -ForegroundColor Yellow
    Write-Host "  3. Viet bai dau tien qua /content-post" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Doc SETUP.md de xem huong dan chi tiet!" -ForegroundColor Cyan
Write-Host ""
