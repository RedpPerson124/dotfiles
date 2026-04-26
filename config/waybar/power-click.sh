#!/bin/bash
BUTTON=$1
if [ "$BUTTON" = "0" ]; then
    swaymsg exit
elif [ "$BUTTON" = "1" ]; then
    systemctl poweroff
fi

