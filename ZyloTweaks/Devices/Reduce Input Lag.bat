@echo off
SETLOCAL ENABLEEXTENSIONS

:: Optimize I/O Priority for explorer.exe and other system processes
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v IoPriority /t REG_DWORD /d 2 /f

:: Set Affinity for explorer.exe to use all cores
start /affinity F explorer.exe

:: Disable various UI delays to improve responsiveness
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f
reg add "HKCU\Control Panel\Desktop" /v WaitToKillAppTimeout /t REG_SZ /d 1000 /f
reg add "HKCU\Control Panel\Desktop" /v HungAppTimeout /t REG_SZ /d 1000 /f

:: Force Time Broker Service to use all CPU cores for thread handling (Scheduler Mode)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TimeBrokerSvc\Parameters" /v ThreadAffinity /t REG_DWORD /d 0xFFFFFFFF /f

:: Restart explorer.exe for changes to take effect
taskkill /f /im explorer.exe
start explorer.exe

echo Optimizations applied. Press any key to exit.
exit
