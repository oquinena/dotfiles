#!/bin/bash

xset s off
xset -b
setxkbmap -option terminate:ctrl_alt_bksp
xset r rate 250 60
WALLPAPER="/home/nomad/Pictures/wallpapers/misty_trees.jpg"

###### For gnome-keyring to work #######
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources # Add colorscheme from .Xresources
xinput --set-prop 12 "Device Enabled" 0
export _JAVA_AWT_WM_NONREPARENTING=1

	sxhkd &
	twmnd &
	nm-applet &
	clipit &
	blueman-applet &
	xset s 600 &
	xss-lock -l -- ~/bin/lock &
	#compton --config ~/.config/compton/compton.conf.20170903 & # compositor 
    /home/nomad/Documents/linux_projects/compton/build/src/compton &
	xsetroot -cursor_name left_ptr &
	~/bin/toggle_touchpad.sh &
    wal -i $WALLPAPER
    feh --bg-tile $WALLPAPER
	~/.config/polybar/launch_polybar.sh &
    xmodmap -e 'keycode 77 = NoSymbol Num_Lock'
    numlockx
    keepassxc &
    "remmina -i"
    #srandrd ~/bin/monitor_handler 
    exec bspwm
