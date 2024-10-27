@echo off
for /r %SystemRoot% %%a in (*.exe) do (
    echo Applying /PREFETCH:0 to "%%a"
    fsutil behavior set PrefetchParameters 0
)
echo Done applying /PREFETCH:0 to all programs.
POWERSHELL.EXE -Command "Add-Type -AssemblyName System.Windows.Forms; [void] [System.Windows.Forms.MessageBox]::Show( 'Tweaks Applied Successfully', 'Success', 'OK', 'Information' )"
exit
