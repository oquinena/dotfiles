#!/usr/bin/env bash

icon="$HOME/.config/i3/i3lock_icon2.png"
tmpbg='/tmp/screen.png'

(( $# )) && { icon=$1; }

#take screenshot
scrot "$tmpbg" 
#convert it
convert "$tmpbg" -scale 5% -scale 2000% "$tmpbg"
convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
#pause notifications
killall -SIGUSR1 dunst

#lock screen with screenshot pixelized and don't fork, allowing dunst to resume
i3lock -u -i "$tmpbg"
#resume notifications
killall -SIGUSR2 dunst
