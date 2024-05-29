#!/bin/bash

# gets the wifi status and sends a notification 
# 'exit' avoids processing everyhting after this point (breaks if we dont use it)
network_status=$(nmcli device status | awk 'NR>1 {print $3; exit}'| awk '{print $1}')

case $network_status in 
"disconnected") notify-send -u critical "WiFi" "disconnected";;
"connected") notify-send -u critical "WiFi" "u good";;
esac