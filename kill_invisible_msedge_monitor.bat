:: kill_invisible_msedge_monitor.bat
@echo off
setlocal enabledelayedexpansion

:loop
set "allInvisible=true"

:: 检查所有msedge进程的窗口状态
tasklist /FI "IMAGENAME eq msedge.exe" 2>NUL | findstr /I "msedge.exe" >NUL
if %errorlevel% equ 0 (
    for /f "tokens=2" %%p in ('tasklist /FI "IMAGENAME eq msedge.exe" /NH /FO CSV') do (
        set "pid=%%~p"
        :: 使用PowerShell检查窗口状态
        powershell -Command "if ((Get-Process -Id !pid!).MainWindowTitle -ne '') { exit 1 }" >NUL
        if !errorlevel! equ 1 set "allInvisible=false"
    )
)

:: 如果所有进程都无窗口则终止
if "!allInvisible!"=="true" (
    taskkill /F /IM msedge.exe >NUL 2>&1
    echo %time% - Terminated all msedge.exe processes
)

:: 等待5秒后继续检查
timeout /t 5 /nobreak >NUL
goto :loop