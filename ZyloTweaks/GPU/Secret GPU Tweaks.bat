@echo off    
echo Applying Ultra-Low Input Latency Settings...

    :: Set Environment Variables for Ultra-Low Input Latency
    setx USE_DOUBLE_BUFFERING 0 /M
    setx FLIP_MODEL 1 /M
    setx SWAP_EFFECT 1 /M

    :: DXGI Present Mode Settings for Ultra-Low Input Latency
    setx DXGI_PRESENT_MODE 3 /M
    setx DXGI_MAX_FRAME_LATENCY 1 /M
    setx DXGI_MAXIMUM_BUFFERED_FRAMES 1 /M

    :: CPU and GPU Settings for Ultra-Low Input Latency
    setx CPU_MAXIMUM_BUFFERED_FRAMES 1 /M
    setx GPU_MAXIMUM_BUFFERED_FRAMES 1 /M
    setx GPU_MAX_FRAME_LATENCY 1 /M
    setx INPUT_LATENCY_POLICY 0 /M

    :: Interrupt Moderation Off
    setx INTERRUPT_MODERATION_POLICY 0 /M

    :: Timer Resolution for Ultra-Low Latency
    reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "TIMER_RESOLUTION_POLICY" /t REG_DWORD /d 0 /f
    reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "TIMER_INTERRUPT_POLICY" /t REG_DWORD /d 1 /f


    echo.
    echo Ultra-Low Input Latency settings applied.
POWERSHELL.EXE -Command "Add-Type -AssemblyName System.Windows.Forms; [void] [System.Windows.Forms.MessageBox]::Show( 'Tweaks Applied Successfully', 'Success', 'OK', 'Information' )"
exit
