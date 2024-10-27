@echo off
:: Disable Dynamic Ticks
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "Disabledynamictick" /t REG_SZ /d "1" /f

:: Disable Platform Tick
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "Useplatformtick" /t REG_SZ /d "0" /f

:: Disable Platform Clock
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "Useplatformclock" /t REG_SZ /d "0" /f

:: Set TSC Sync Policy to Enhanced
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "Tscsyncpolicy" /t REG_SZ /d "Enhanced" /f

:: Set Timer Resolution Policy to Highest Precision
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "TIMER_RESOLUTION_POLICY" /t REG_SZ /d "1" /f

:: Set Timer Interrupt Policy to Prioritize Interrupts
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "TIMER_INTERRUPT_POLICY" /t REG_SZ /d "1" /f

:: Set Real-Time Priority for Timer Operations
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "TIMER_REALTIME_PRIORITY_POLICY" /t REG_SZ /d "1" /f

:: Set High Multimedia Timer Precision
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "MMTIMER_RESOLUTION_POLICY" /t REG_SZ /d "1" /f

:: Set Timer Clock Source to TSC
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "TIMER_CLOCK_SOURCE" /t REG_SZ /d "2" /f

:: Set Timer Polling Rate to Max
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "TIMER_POLLING_RATE_POLICY" /t REG_SZ /d "9" /f

:: Disable Timer Event Deferring
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "TIMER_DEFER_POLICY" /t REG_SZ /d "0" /f

:: Set Timer Sync Policy to Aggressive Sync
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "TIMER_SYNC_POLICY" /t REG_SZ /d "1" /f

:: Set Timer Interrupt Affinity to All Cores
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "TIMER_INTERRUPT_AFFINITY_POLICY" /t REG_SZ /d "F" /f

:: Set Timer Tickless Policy to Disable Tickless Idle
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "TIMER_TICKLESS_POLICY" /t REG_SZ /d "1" /f

:: Set Timer Pending I/O Policy to Minimize I/O Latency
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "TIMER_PENDING_IO_POLICY" /t REG_SZ /d "1" /f

:: Force TSC as the Timer Source
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "TIMER_FORCE_TSC_POLICY" /t REG_SZ /d "1" /f

:: Set DPC Latency Policy for Fastest DPC Handling
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DPC_LATENCY_POLICY" /t REG_SZ /d "1" /f

:: Set Maximum DPC Latency for Low Latency
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DPC_MAX_LATENCY_POLICY" /t REG_SZ /d "1" /f

:: Set IRQ Latency Policy to Minimize Interrupt Latency
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "IRQ_LATENCY_POLICY" /t REG_SZ /d "1" /f

:: Set IRQ Affinity to All Cores
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "IRQ_AFFINITY_POLICY" /t REG_SZ /d "F" /f

:: Set Real-Time Thread Scheduling for Priority
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "REALTIME_THREAD_POLICY" /t REG_SZ /d "1" /f

:: Set Real-Time Thread Affinity for Load Distribution
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "REALTIME_THREAD_AFFINITY_POLICY" /t REG_SZ /d "F" /f

:: Set DPC Timer Policy to Minimize Delays
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DPC_TIMER_POLICY" /t REG_SZ /d "1" /f

:: Set Timer Interrupt Rate to Fastest
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "TIMER_INTERRUPT_RATE_POLICY" /t REG_SZ /d "1" /f

:: Set Timer Batch Policy to Process Events Immediately
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "TIMER_BATCH_POLICY" /t REG_SZ /d "0" /f

:: Force Real-Time Tasks to Use TSC
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "TIMER_REALTIME_TSC_POLICY" /t REG_SZ /d "1" /f

:: Enable Deeper Nesting of Timer Interrupts
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "TIMER_INTERRUPT_DEPTH_POLICY" /t REG_SZ /d "1" /f

:: Enable High Precision Mode for Timers
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "TIMER_HIGH_PRECISION_MODE" /t REG_SZ /d "1" /f

:: Override Standard Timer Resolution for Finer Control
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "TIMER_RESOLUTION_OVERRIDE_POLICY" /t REG_SZ /d "1" /f

:: Set Timer Stability Policy to Reduce Jitter
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "TIMER_STABILITY_POLICY" /t REG_SZ /d "1" /f

:: Notify the user that all low-latency tweaks have been applied
echo All low-latency and timer-related registry tweaks applied successfully.
POWERSHELL.EXE -Command "Add-Type -AssemblyName System.Windows.Forms; [void] [System.Windows.Forms.MessageBox]::Show( 'Tweaks Applied Successfully', 'Success', 'OK', 'Information' )"
exit
