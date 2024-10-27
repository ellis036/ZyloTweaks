@echo off

:: Check if SetTimerResolution.exe is running and terminate it
echo Checking for running instances of SetTimerResolution.exe...
tasklist /FI "IMAGENAME eq SetTimerResolution.exe" | find /i "SetTimerResolution.exe" >nul
if not errorlevel 1 (
    echo SetTimerResolution.exe is running, terminating...
    taskkill /F /IM SetTimerResolution.exe
) else (
    echo No running instances of SetTimerResolution.exe found.
)

:: Search specific directories and delete any existing SetTimerResolution.exe files

echo Searching and deleting existing SetTimerResolution.exe files in specific directories...

:: Search and delete in the root of C:\
if exist "C:\SetTimerResolution.exe" (
    echo Deleting C:\SetTimerResolution.exe
    del /f /q "C:\SetTimerResolution.exe"
)

:: Search and delete on the Desktop
if exist "%UserProfile%\Desktop\SetTimerResolution.exe" (
    echo Deleting %UserProfile%\Desktop\SetTimerResolution.exe
    del /f /q "%UserProfile%\Desktop\SetTimerResolution.exe"
)

:: Search and delete in the Downloads folder
if exist "%UserProfile%\Downloads\SetTimerResolution.exe" (
    echo Deleting %UserProfile%\Downloads\SetTimerResolution.exe
    del /f /q "%UserProfile%\Downloads\SetTimerResolution.exe"
)

:: Define temporary download path
set downloadPath="%temp%\SetTimerResolution.exe"

:: Download the SetTimerResolution.exe from your GitHub repository to a temporary location using PowerShell
powershell -Command "Invoke-WebRequest -Uri 'https://github.com/kizzimo/time-res/raw/main/SetTimerResolution.exe' -OutFile %downloadPath%"

:: Move the file to C:\ after successful download
if exist "C:\SetTimerResolution.exe" (
    del "C:\SetTimerResolution.exe"
)

move /y %downloadPath% "C:\SetTimerResolution.exe"

:: Check if the move was successful
if not exist "C:\SetTimerResolution.exe" (
    echo Download failed or file could not be moved. Exiting...
    exit /b 1
)

:: Create a shortcut in the same location as the executable (C:\)
set shortcutPath="C:\SetTimerResolution.lnk"
set exePath="C:\SetTimerResolution.exe"

:: Create a VBS script to handle the shortcut creation
echo Set oWS = WScript.CreateObject("WScript.Shell") > "%temp%\CreateShortcut.vbs"
echo sLinkFile = "%shortcutPath%" >> "%temp%\CreateShortcut.vbs"
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> "%temp%\CreateShortcut.vbs"
echo oLink.TargetPath = "%exePath%" >> "%temp%\CreateShortcut.vbs"
echo oLink.Arguments = "--resolution 5100 --no-console" >> "%temp%\CreateShortcut.vbs"
echo oLink.Save >> "%temp%\CreateShortcut.vbs"

:: Run the VBS script to create the shortcut
cscript //nologo "%temp%\CreateShortcut.vbs"

:: Clean up the VBS script
del "%temp%\CreateShortcut.vbs"

:: Create a scheduled task that runs SetTimerResolution.exe with admin rights at logon
schtasks /create /f /rl highest /tn "SetTimerResolution" /tr "%exePath% --resolution 5100 --no-console" /sc onlogon /ru "%USERNAME%"

:: Apply BCDEdit settings for platform ticks
bcdedit /deletevalue useplatformtick
bcdedit /deletevalue disabledynamictick

:: Add GlobalTimerResolutionRequests and SerializeTimerExpiration in the kernel key
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v GlobalTimerResolutionRequests /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v SerializeTimerExpiration /t REG_DWORD /d 0 /f

echo BCDEdit settings applied and HPET disabled.
echo Shortcut created in C:\ and scheduled task set with highest privileges.
echo Registry settings for GlobalTimerResolutionRequests and SerializeTimerExpiration added.
POWERSHELL.EXE -Command "Add-Type -AssemblyName System.Windows.Forms; [void] [System.Windows.Forms.MessageBox]::Show( 'Tweaks Applied Successfully', 'Success', 'OK', 'Information' )"
exit
