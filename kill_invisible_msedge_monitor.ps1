# kill_invisible_msedge_monitor.ps1
$interval = 5  # 检查间隔(秒)

while ($true) {
    # 获取所有msedge进程
    $processes = Get-Process -Name msedge -ErrorAction SilentlyContinue
  
    if ($processes) {
        # 检查是否所有进程都没有可见窗口
        $allInvisible = $true
        foreach ($proc in $processes) {
            if ($proc.MainWindowTitle -ne '') {
                $allInvisible = $false
                break
            }
        }
      
        # 如果所有进程都没有窗口，则终止
        if ($allInvisible) {
            $processes | Stop-Process -Force
            Write-Host "$(Get-Date) - Terminated all msedge.exe processes (no visible windows)"
        }
    }
  
    # 等待下次检查
    Start-Sleep -Seconds $interval
}