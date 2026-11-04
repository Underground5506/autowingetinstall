
@echo off
title WinGet Full Installation
color 0B

echo ========================================
echo       WINGET AUTOMATIC INSTALLER
echo ========================================
echo.

:: Check administrator privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Please run this script as Administrator.
    pause
    exit /b 1
)

echo Downloading and installing dependencies...
echo.

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
"$ErrorActionPreference='Stop'; try { ^
$dir=Join-Path $env:TEMP 'WingetSetup'; ^
New-Item -ItemType Directory -Force -Path $dir | Out-Null; ^
$v=Join-Path $dir 'VCLibs.appx'; ^
$x=Join-Path $dir 'UI.Xaml.zip'; ^
$b=Join-Path $dir 'AppInstaller.msixbundle'; ^
Write-Host '[1/4] Downloading Visual C++ dependencies...'; ^
Invoke-WebRequest 'https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx' -OutFile $v; ^
Write-Host '[2/4] Downloading UI.Xaml...'; ^
Invoke-WebRequest 'https://www.nuget.org/api/v2/package/Microsoft.UI.Xaml/2.8.6' -OutFile $x; ^
Expand-Archive $x -DestinationPath (Join-Path $dir 'Xaml') -Force; ^
$ui=Join-Path $dir 'Xaml\tools\AppX\x64\Release\Microsoft.UI.Xaml.2.8.appx'; ^
Write-Host '[3/4] Downloading Microsoft App Installer...'; ^
Invoke-WebRequest 'https://aka.ms/getwinget' -OutFile $b; ^
Write-Host '[4/4] Installing packages...'; ^
Add-AppxPackage -Path $v; ^
Add-AppxPackage -Path $ui; ^
Add-AppxPackage -Path $b -ErrorAction Stop; ^
Write-Host 'Installation completed successfully!' -ForegroundColor Green; ^
exit 0 ^
} catch { Write-Host ('INSTALLATION ERROR: '+$_.Exception.Message) -ForegroundColor Red; exit 1 }"

if errorlevel 1 (
    echo.
    echo Installation failed!
) else (
    echo.
    echo WinGet installation was successful!
    echo.
    echo Testing WinGet...
    winget --version
)

echo.
pause
