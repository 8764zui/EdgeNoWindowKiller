# EdgeNoWindowKiller
Windows
PowerShell
License: MIT

一个轻量级后台监控工具，当检测到所有 Microsoft Edge 进程都没有可见窗口时自动终止它们。适用于需要强制关闭后台 Edge 进程的场景，如资源清理、隐私保护或自动化测试。

功能特性
🔍 实时监控所有 Microsoft Edge 进程
🚫 智能检测无可见窗口的 Edge 实例
⚡ 当所有 Edge 窗口都不可见时自动终止进程
💻 低资源占用后台运行
⚙️ 可配置检查间隔时间
使用场景
自动化测试后清理残留进程
强制关闭后台运行的 Edge 扩展/服务
隐私保护（关闭后台跟踪进程）
系统资源优化（释放内存/CPU）
开发/调试环境管理
快速开始
方法1：直接运行 BAT 文件（推荐）
下载 kill_invisible_msedge_monitor.bat
双击运行脚本
监控将在后台静默运行（无可见窗口）
方法2：使用 PowerShell 脚本（更灵活）
下载 kill_invisible_msedge_monitor.ps1
在 PowerShell 中运行：
powershell

复制代码

查看全部
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser  # 仅需执行一次
.\kill_invisible_msedge_monitor.ps1
配置选项
修改检查间隔时间
编辑脚本文件，修改顶部的 $interval 变量（单位：秒）：

powershell

复制代码

查看全部
# 在 PS1 文件中修改
$interval = 10  # 每10秒检查一次
batch

复制代码

查看全部
:: 在 BAT 文件中修改
timeout /t 10 /nobreak >NUL  # 修改此行中的数字
启动参数（仅限 PowerShell）
运行脚本时添加间隔参数：

powershell

复制代码

查看全部
.\kill_invisible_msedge_monitor.ps1 -IntervalSeconds 15
停止监控
方法1：任务管理器
打开任务管理器
结束名为 Windows PowerShell 或 cmd.exe 的进程
方法2：命令行
batch

复制代码

查看全部
:: 停止所有监控实例
taskkill /FI "IMAGENAME eq powershell.exe" /FI "WINDOWTITLE eq Windows PowerShell"
taskkill /FI "IMAGENAME eq cmd.exe"
注意事项
管理员权限：普通用户权限即可终止当前用户启动的进程
系统兼容性：
Windows 7 或更高版本
PowerShell 5.1+ (预装于 Windows 10+)
所有 Microsoft Edge 版本
进程保留：
脚本不会终止有可见窗口的 Edge 实例
系统级 Edge 进程（如 Edge Update）不会被终止
资源占用：约 1-5MB 内存，接近 0% CPU 使用率
贡献指南
欢迎提交 Issues 和 Pull Requests！

报告问题：创建 New Issue
贡献代码：
bash

复制代码

查看全部
git clone https://github.com/yourusername/EdgeNoWindowKiller.git
cd EdgeNoWindowKiller
# 修改后提交 PR
许可证
本项目采用 MIT 许可证 - 可自由使用、修改和分发。

text

复制代码

查看全部
Copyright (c) 2025 Your Name

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
提示：首次运行 PowerShell 脚本可能需要执行权限策略调整：
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
