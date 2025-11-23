#!/bin/bash

PID_FILE="/tmp/native_clicker.pid"

if [ -f "$PID_FILE" ]; then
    # --- STOPPING ---
    # Read the PID and kill the specific background loop process
    PID=$(cat "$PID_FILE")
    
    # kill -9 ensures it stops immediately, no waiting
    kill -9 "$PID" 2>/dev/null
    
    rm "$PID_FILE"
    notify-send "AutoClicker" "OFF (wlrctl)" -t 1000
else
    # --- STARTING ---
    # We start a subshell (...) that runs an infinite loop
    # Adjust 'sleep 0.02' to change speed. 
    # 0.02 = ~50 clicks/sec. 0.1 = 10 clicks/sec.
    (while true; do 
        wlrctl pointer click
        sleep 0.02
    done) & 
    
    # Capture the Process ID of the loop we just started
    echo $! > "$PID_FILE"
    notify-send "AutoClicker" "ON (wlrctl)" -t 1000
fi
