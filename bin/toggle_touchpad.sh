#!/bin/bash

# Ett litet skript för att slå av/på touchpaden.

device=$(xinput| grep Touchpad |awk '{print $5}' | sed 's/id=//')
status=$(xinput --list-props $device | grep "Device Enabled" | awk '{ print $4}')


if [ $status == "1" ]; then
	xinput --set-prop $device "Device Enabled" 0
    echo "Touchpad turned off"
	#notify-send -a Touchpad "Touchpad turned off"
else
	echo "Touchpad turned on"
	xinput --set-prop $device "Device Enabled" 1
	xinput --set-prop $device "libinput Tapping Enabled" 1&
	xinput --set-prop $device "libinput Natural Scrolling Enabled" 1
	#notify-send -a Touchpad "Touchpad turned on"
fi
