@echo off
echo Applying 'Lowest Input Latency Possible'...
    reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v PStateTime /t REG_DWORD /d 0x01000001 /f
    echo Value applied: 01000001
POWERSHELL.EXE -Command "Add-Type -AssemblyName System.Windows.Forms; [void] [System.Windows.Forms.MessageBox]::Show( 'Tweaks Applied Successfully', 'Success', 'OK', 'Information' )"
exit
