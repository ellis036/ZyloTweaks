@echo off
SETLOCAL ENABLEEXTENSIONS

:: Create the directory for the script if it doesn't exist
if not exist "C:\Scripts" mkdir "C:\Scripts"

:: Create the batch script that sets global CPU affinity for all processes
(
echo @echo off
echo SETLOCAL ENABLEEXTENSIONS
echo.
echo :: Get the number of logical processors
echo for /f "tokens=2 delims==^" %%%%a in ^('wmic cpu get NumberOfLogicalProcessors /value^' ^) do set /a num_cpus=%%%%a
echo :: Calculate the affinity mask for all processors
echo set /a affinity_mask=0
echo for /l %%%%b in ^(1,1,%%num_cpus%%^) do set /a affinity_mask^|=1^<<%%%%b-1
echo.
echo :: Convert affinity_mask to hexadecimal
echo for /f "tokens=2 delims==^" %%%%c in ^('cmd /c exit /b %%affinity_mask%% ^&^& echo %%^=ExitCodeAscii%%'^) do set hex_mask=%%%%c
echo.
echo :: Set affinity for all processes
echo for /f "skip=1 tokens=2 delims=,^" %%%%p in ^('wmic process get ProcessId^,Name /format:csv^' ^) do ^
echo PowerShell -Command ^"$Process = Get-Process -Id %%%%p -ErrorAction SilentlyContinue; if ^($Process^) { $Process.ProcessorAffinity=%%affinity_mask%% }^"
) > "C:\Scripts\SetGlobalAffinity.bat"

:: Create a scheduled task to run the script every minute as SYSTEM
schtasks /create /tn "Set Global Affinity" /tr "C:\Scripts\SetGlobalAffinity.bat" /sc minute /mo 1 /ru SYSTEM /rl HIGHEST /f

:: Confirm the task was created
echo Scheduled task created to run every minute as SYSTEM. Check with 'schtasks /query /tn "Set Global Affinity"' to verify.
POWERSHELL.EXE -Command "Add-Type -AssemblyName System.Windows.Forms; [void] [System.Windows.Forms.MessageBox]::Show( 'Tweaks Applied Successfully', 'Success', 'OK', 'Information' )"
exit
