@echo off
echo Setting up cmd to open PowerShell...

REM Check if running as administrator
openfiles >nul 2>&1
if %errorlevel% neq 0 (
    echo Please run this script as an administrator.
    pause
    exit /b 1
)

:MENU
echo 1. Add
echo 2. Remove
echo 3. Exit
set /p choice=Please choose an option (1, 2, 3): 

if "%choice%"=="1" (
    call :Add
) else if "%choice%"=="2" (
    call :Remove
) else if "%choice%"=="3" (
    echo Exiting the script.
    exit /b
) else (
    echo Invalid choice. Please choose
    goto :MENU
)
pause
exit /b

:Add
REM Set the registry key to point cmd.exe to PowerShell
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\cmd.exe" /ve /t REG_SZ /d "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\cmd.exe" /v Path /t REG_SZ /d "C:\Windows\System32\WindowsPowerShell\v1.0" /f

if %errorlevel% equ 0 (
    echo Successfully set cmd to open PowerShell.
) else (
    echo Failed to set cmd to open PowerShell. Please run the script as an administrator.
)
goto :eof

:Remove
REM Remove the registry key
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\cmd.exe" /f

if %errorlevel% equ 0 (
    echo Successfully removed the custom cmd to PowerShell setup.
) else (
    echo Failed to remove the custom cmd to PowerShell setup. Please run the script as an administrator.
)
goto :eof

