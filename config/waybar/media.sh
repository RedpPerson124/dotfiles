#!/bin/bash
# outputs current media player status for Waybar

player=$(playerctl --list-all 2>/dev/null | head -n 1)

if [ -z "$player" ]; then
    echo "No media"
    exit 0
fi

status=$(playerctl -p "$player" status)
artist=$(playerctl -p "$player" metadata artist)
title=$(playerctl -p "$player" metadata title)

if [ "$status" = "Playing" ]; then
    echo "$artist - $title"
elif [ "$status" = "Paused" ]; then
    echo "Paused: $artist - $title"
else
    echo "No media"
fi
