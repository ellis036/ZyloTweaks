@echo off

netsh int tcp set global rss=enabled
netsh int tcp set global autotuninglevel=experimental
netsh int tcp set global ecncapability=enabled
netsh int tcp set global timestamps=disabled
netsh int tcp set global initialrto=300
netsh int tcp set global rsc=enabled
netsh int tcp set global nonsackrttresiliency=enabled
netsh int tcp set global maxsynretransmissions=3
netsh int tcp set global fastopen=enabled
netsh int tcp set global fastopenfallback=enabled
netsh int tcp set global hystart=enabled
netsh int tcp set global prr=enabled
netsh int tcp set global pacingprofile=off


POWERSHELL.EXE -Command "Add-Type -AssemblyName System.Windows.Forms; [void] [System.Windows.Forms.MessageBox]::Show( 'Tweaks Applied Successfully', 'Success', 'OK', 'Information' )"
exit
