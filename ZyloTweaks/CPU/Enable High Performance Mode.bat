@echo off
:: Set ThreadPool Min Threads for Max Throughput
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "ThreadPoolMinThreads" /t REG_DWORD /d 2 /f

:: Set ThreadPool Max Threads for Max Throughput
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "ThreadPoolMaxThreads" /t REG_DWORD /d 4 /f

:: Set IOCP Concurrency for Max Throughput
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "IOCPConcurrency" /t REG_DWORD /d 1 /f

:: Notify the user that max throughput settings have been applied
echo Max throughput settings applied successfully.
POWERSHELL.EXE -Command "Add-Type -AssemblyName System.Windows.Forms; [void] [System.Windows.Forms.MessageBox]::Show( 'Tweaks Applied Successfully', 'Success', 'OK', 'Information' )"
exit

