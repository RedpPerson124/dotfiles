#!/bin/bash
device_name=$(bluetoothctl info | grep "Name" | head -n 1 | cut -d ' ' -f2-)

if [ -z "$device_name" ]; then
  echo "Bluetooth not connected"
else
  echo "$device_name"
fi
