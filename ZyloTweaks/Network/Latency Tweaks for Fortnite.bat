@echo off
setlocal

:: Set the URL of the Engine.ini file
set "url=https://raw.githubusercontent.com/kizzimo/Engine-3/main/Engine.ini"

:: Get the user's Fortnite config path
set "configPath=%USERPROFILE%\AppData\Local\FortniteGame\Saved\Config\WindowsClient"

:: Check if the path exists
if not exist "%configPath%" (
    echo Fortnite configuration path not found. Exiting.
    exit /b
)

:: Remove read-only attribute from the original Engine.ini if it exists
if exist "%configPath%\Engine.ini" (
    echo Removing read-only attribute from the original Engine.ini...
    attrib -R "%configPath%\Engine.ini"
)

:: Create a backup of the current Engine.ini
if exist "%configPath%\Engine.ini" (
    echo Backing up the original Engine.ini...
    copy /y "%configPath%\Engine.ini" "%configPath%\Engine_backup.ini"
)

:: Download the new Engine.ini from GitHub
echo Downloading the new Engine.ini file...
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%url%', '%configPath%\Engine.ini')"


if errorlevel 1 (
    echo Failed to download the Engine.ini file. Exiting.
    exit /b
)

:: Set the new Engine.ini as read-only
echo Setting the new Engine.ini as read-only...
attrib +R "%configPath%\Engine.ini"

:: Open the folder to view the backup and the new file
explorer.exe "%configPath%"

POWERSHELL.EXE -Command "Add-Type -AssemblyName System.Windows.Forms; [void] [System.Windows.Forms.MessageBox]::Show( 'Tweaks Applied Successfully', 'Success', 'OK', 'Information' )"
exit
