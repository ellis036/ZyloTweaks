@echo off
REM Set the best TCP settings for performance

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

echo All TCP settings have been configured for best performance.
exit
