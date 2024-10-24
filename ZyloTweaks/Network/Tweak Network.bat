@echo off
:LowLatency
echo Applying Low Latency settings...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Direct3D" /v MaxBufferCount /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Direct3D" /v MaxFrameLatency /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Direct3D" /v FPUPreserve /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Direct3D" /v SoftwareVertexProcessing /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Direct3D" /v UseVSync /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Direct3D" /v BufferCount /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Direct3D" /v PresentationInterval /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Direct3D" /v FrameLatency /t REG_DWORD /d 1 /f

echo "Low Latency settings applied successfully."
pause
goto Menu

:: Function to apply Smooth settings
:Smooth
echo Applying Smooth settings...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Direct3D" /v MaxBufferCount /t REG_DWORD /d 2 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Direct3D" /v MaxFrameLatency /t REG_DWORD /d 2 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Direct3D" /v FPUPreserve /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Direct3D" /v SoftwareVertexProcessing /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Direct3D" /v UseVSync /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Direct3D" /v BufferCount /t REG_DWORD /d 2 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Direct3D" /v PresentationInterval /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Direct3D" /v FrameLatency /t REG_DWORD /d 2 /f

echo "Smooth settings applied successfully."
pause