#!/bin/bash
# Get battery percentage and charging state
BAT_INFO=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0)
PERC=$(echo "$BAT_INFO" | awk '/percentage:/ {gsub("%","",$2); print $2}')
STATE=$(echo "$BAT_INFO" | awk '/state:/ {print $2}')

# Add lightning bolt if charging
if [ "$STATE" = "charging" ]; then
    SYMBOL="⚡"
else
    SYMBOL=""
fi

echo "$PERC$SYMBOL"
