# TMXC OS - Volla Phone Quintus Build Script
# Copyright (c) 2026 Ödül Ensar Yılmaz. All rights reserved.
#
# Build script for MediaTek Dimensity 7050 (MT6877)
# Volla Phone Quintus specific implementation

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "TMXC OS - Volla Phone Quintus Build" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if aarch64-none-elf-gcc is available
Write-Host "Checking for ARM64 toolchain..." -ForegroundColor Yellow
$aarch64Gcc = Get-Command aarch64-none-elf-gcc -ErrorAction SilentlyContinue

if (-not $aarch64Gcc) {
    Write-Host "ERROR: aarch64-none-elf-gcc not found!" -ForegroundColor Red
    Write-Host "Please install the ARM64 toolchain:" -ForegroundColor Red
    Write-Host "  - Download from: https://developer.arm.com/downloads/-/gnu-rm" -ForegroundColor Red
    Write-Host "  - Or use: choco install gcc-arm-embedded" -ForegroundColor Red
    exit 1
}

Write-Host "ARM64 toolchain found: $($aarch64Gcc.Source)" -ForegroundColor Green
Write-Host ""

# Clean previous build
Write-Host "Cleaning previous build..." -ForegroundColor Yellow
if (Test-Path "build") {
    Remove-Item -Recurse -Force "build"
}
Write-Host "Clean complete" -ForegroundColor Green
Write-Host ""

# Build the kernel
Write-Host "Building TMXC OS kernel..." -ForegroundColor Yellow
make all

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "Build successful!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Output: build/tmx_os.bin" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Target: Volla Phone Quintus" -ForegroundColor Cyan
    Write-Host "SoC: MediaTek Dimensity 7050 (MT6877TT)" -ForegroundColor Cyan
    Write-Host "CPU: 2x Cortex-A78 @ 2.6GHz + 6x Cortex-A55 @ 2.0GHz" -ForegroundColor Cyan
    Write-Host "RAM: 8GB LPDDR5" -ForegroundColor Cyan
    Write-Host "Display: 6.78"" AMOLED, 2400x1080, 120Hz" -ForegroundColor Cyan
    Write-Host ""
} else {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Red
    Write-Host "Build failed!" -ForegroundColor Red
    Write-Host "========================================" -ForegroundColor Red
    exit 1
}
