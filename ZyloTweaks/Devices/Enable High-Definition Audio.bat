@echo off
for /r %SystemRoot% %%a in (*.exe) do (
    echo Applying /PREFETCH:0 to "%%a"
    fsutil behavior set PrefetchParameters 0
)
echo Done applying /PREFETCH:0 to all programs.
exit
