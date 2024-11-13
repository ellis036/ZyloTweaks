@echo off
set "nvidiaGLCache=%LOCALAPPDATA%\NVIDIA\GLCache"
if exist "%nvidiaGLCache%" (
    del /q /s "%nvidiaGLCache%\*.*"
    
) else (
    
)


set "tempFolder=%LOCALAPPDATA%\Temp"
if exist "%tempFolder%" (
    del /q /s "%tempFolder%\*.*"
    echo Contents of Temp folder have been deleted.
) else (
    echo Temp folder not found.
)


del /q /s "C:\Windows\Temp\*.*"



del /q /s "C:\Windows\Prefetch\*.*"



for /F "tokens=*" %%G in ('wevtutil el') DO wevtutil cl "%%G"



RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8



net stop wuauserv
rd /s /q "%windir%\SoftwareDistribution\DataStore"
net start wuauserv



del /q /s "%LOCALAPPDATA%\Microsoft\Windows\WER\ReportQueue\*"



del /q /s "%windir%\Temp\*"



del /q /s "%windir%\Minidump\*"



for /D %%i in ("%windir%\Logs\*") do (
    rmdir /s /q "%%i"
)

POWERSHELL.EXE -Command "Add-Type -AssemblyName System.Windows.Forms; [void] [System.Windows.Forms.MessageBox]::Show( 'Tweaks Applied Successfully', 'Success', 'OK', 'Information' )"
exit
