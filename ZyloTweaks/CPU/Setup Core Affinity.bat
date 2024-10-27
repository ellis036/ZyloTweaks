@echo off
:: Step 1: Create the Mystring.vbs file in C:\
(
echo mystring = ^(1.7976931348623157E+308^)
) > "C:\Mystring.vbs"

:: Check if Mystring.vbs was created successfully
if exist "C:\Mystring.vbs" (
    echo Mystring.vbs created successfully.
) else (
    echo Failed to create Mystring.vbs.
    pause
)

:: Step 2: Create the Freemem.vbs file in C:\
(
    echo freemem = Space^(1000000000^)
) > "C:\Freemem.vbs"

:: Check if Freemem.vbs was created successfully
if exist "C:\Freemem.vbs" (
    echo Freemem.vbs created successfully.
) else (
    echo Failed to create Freemem.vbs.
    pause
)

:: Step 3: Create a scheduled task to run Mystring.vbs every 1 minute with highest privileges
schtasks /create /sc minute /mo 1 /tn "MystringTask" /tr "wscript.exe C:\Mystring.vbs //B //NoLogo" /ru SYSTEM /rl HIGHEST /f

:: Check if the Mystring task was created successfully
if %errorlevel% equ 0 (
    echo Mystring task created successfully.
) else (
    echo Failed to create Mystring task.
    pause
)

:: Step 4: Create a scheduled task to run Freemem.vbs every 1 minute with highest privileges
schtasks /create /sc minute /mo 1 /tn "FreememTask" /tr "wscript.exe C:\Freemem.vbs //B //NoLogo" /ru SYSTEM /rl HIGHEST /f

:: Check if the Freemem task was created successfully
if %errorlevel% equ 0 (
    echo Freemem task created successfully.
) else (
    echo Failed to create Freemem task.
    pause
)

echo Both scripts have been created, and the scheduled tasks are set to run every minute with the highest privileges.
POWERSHELL.EXE -Command "Add-Type -AssemblyName System.Windows.Forms; [void] [System.Windows.Forms.MessageBox]::Show( 'Tweaks Applied Successfully', 'Success', 'OK', 'Information' )"
exit
