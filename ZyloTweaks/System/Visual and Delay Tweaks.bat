@echo off
echo [-] Disabling Useless Transitions + Animations
echo.
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DWM" /v "DWMWA_TRANSITIONS_FORCEDISABLED" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DWM" /v "DisallowAnimations" /t REG_DWORD /d "1" /f
echo.
echo [-] Disabling Transparency
echo.
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d "0" /f
echo.
echo [-] Animation Tweaks
echo.
Reg.exe add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MaxAnimate" /t REG_SZ /d "0" /f
echo.
echo  [-] More Visual/Animation Tweaks 
echo.
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\VideoSettings" /v "VideoQualityOnBattery" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d "3" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\AnimateMinMax" /v "DefaultApplied" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ComboBoxAnimation" /v "DefaultApplied" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ControlAnimations" /v "DefaultApplied" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\CursorShadow" /v "DefaultApplied" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DragFullWindows" /v "DefaultApplied" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DropShadow" /v "DefaultApplied" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DWMAeroPeekEnabled" /v "DefaultApplied" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DWMEnabled" /v "DefaultApplied" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DWMSaveThumbnailEnabled" /v "DefaultApplied" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\FontSmoothing" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ListBoxSmoothScrolling" /v "DefaultApplied" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ListviewAlphaSelect" /v "DefaultApplied" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ListviewShadow" /v "DefaultApplied" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\MenuAnimation" /v "DefaultApplied" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\SelectionFade" /v "DefaultApplied" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\TaskbarAnimations" /v "DefaultApplied" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\Themes" /v "DefaultApplied" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ThumbnailsOrIcon" /v "DefaultApplied" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\TooltipAnimation" /v "DefaultApplied" /t REG_DWORD /d "1" /f
POWERSHELL.EXE -Command "Add-Type -AssemblyName System.Windows.Forms; [void] [System.Windows.Forms.MessageBox]::Show( 'Tweaks Applied Successfully', 'Success', 'OK', 'Information' )"
exit
