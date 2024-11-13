@echo off

echo Cleaning NVIDIA GLCache folder...
set "nvidiaGLCache=%LOCALAPPDATA%\NVIDIA\GLCache"
if exist "%nvidiaGLCache%" (
    del /q /s "%nvidiaGLCache%\*.*"
    echo Contents of GLCache folder have been deleted.
) else (
    echo GLCache folder not found.
)

echo Cleaning Temp folder...
set "tempFolder=%LOCALAPPDATA%\Temp"
if exist "%tempFolder%" (
    del /q /s "%tempFolder%\*.*"
    echo Contents of Temp folder have been deleted.
) else (
    echo Temp folder not found.
)

echo Cleaning C:\Windows\Temp folder...
del /q /s "C:\Windows\Temp\*.*"
echo Contents of C:\Windows\Temp folder have been deleted.

echo Cleaning C:\Windows\Prefetch folder...
del /q /s "C:\Windows\Prefetch\*.*"
echo Contents of C:\Windows\Prefetch folder have been deleted.

echo Cleaning system log files...
for /F "tokens=*" %%G in ('wevtutil el') DO wevtutil cl "%%G"
echo System log files have been cleared.

echo Cleaning Internet Explorer cache...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8
echo Internet Explorer cache has been cleared.

echo Cleaning Windows Update cache...
net stop wuauserv
rd /s /q "%windir%\SoftwareDistribution\DataStore"
net start wuauserv
echo Windows Update cache has been cleared.

echo Cleaning Windows Error Reporting files...
del /q /s "%LOCALAPPDATA%\Microsoft\Windows\WER\ReportQueue\*"
echo Windows Error Reporting files have been deleted.

echo Cleaning Windows temporary files...
del /q /s "%windir%\Temp\*"
echo Windows temporary files have been deleted.

echo Cleaning Windows memory dump files...
del /q /s "%windir%\Minidump\*"
echo Windows memory dump files have been deleted.

echo Cleaning Windows logs...
for /D %%i in ("%windir%\Logs\*") do (
    rmdir /s /q "%%i"
)
echo Windows logs have been cleared.

echo Cleanup complete.

POWERSHELL.EXE -Command "Add-Type -AssemblyName System.Windows.Forms; [void] [System.Windows.Forms.MessageBox]::Show( 'Tweaks Applied Successfully', 'Success', 'OK', 'Information' )"
exit
