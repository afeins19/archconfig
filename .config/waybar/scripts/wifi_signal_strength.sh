#!/bin/bash

# Automatically detect the wireless interface
interface=$(iw dev | grep Interface | awk '{print $2}')

# Check if interface detection was successful
if [ -z "$interface" ]; then
    echo '{"essid": "No interface detected", "strength_level": -1, "signal_percent": 0}'
    exit 1
fi

# Get the signal strength in dBm using iw
signal_dbm=$(iw dev $interface link | grep -i 'signal' | awk '{print $2}' | cut -d'=' -f2)

# Define max and min dBm values
max_dbm=-30
min_dbm=-90

# Calculate signal percentage and determine strength level
if [ -n "$signal_dbm" ]; then
    # Convert dBm to a percentage
    signal_percent=$((100 * (signal_dbm - min_dbm) / (max_dbm - min_dbm)))
    signal_percent=$(echo $signal_percent | awk '{if ($1>100) print 100; else if ($1<0) print 0; else print $1}')

    # Determine strength level based on signal percentage
    if (( signal_percent >= 75 )); then
        strength_level=3
    elif (( signal_percent >= 50 )); then
        strength_level=2
    elif (( signal_percent >= 25 )); then
        strength_level=1
    else
        strength_level=0
    fi
else
    echo '{"essid": "No signal", "strength_level": -1, "signal_percent": 0}'
fi

# Output JSON format with ESSID, strength level, and signal percentage
echo "{\"essid\": \"$interface\", \"strength_level\": $strength_level, \"signal_percent\": $signal_percent}"
