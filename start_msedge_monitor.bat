:: start_msedge_monitor.bat
@echo off
setlocal

:: 以隐藏窗口方式启动监控脚本
start /B powershell -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File "%~dp0kill_invisible_msedge_monitor.ps1"

echo Microsoft Edge monitor started in background.
echo [PID: %errorlevel%] - Use taskkill /PID [PID] to stop monitoring
endlocal