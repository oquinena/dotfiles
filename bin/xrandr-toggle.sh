#!/bin/bash

state=$(xrandr | grep HDMI-2 | awk '{print $2}')

if [ $state == "connected" ]; then
    xrandr --output eDP-1 --auto --output HDMI-2 --above eDP-1 --auto
    echo "Nu kör vi dubbla skärmar"
else
    xrandr --output HDMI-2 --off
fi
