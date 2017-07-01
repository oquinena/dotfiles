#!/bin/sh
acpi -b | awk -F'[,:%]' '{print $2, $3}' | {
	read -r status capacity

	if   [ "$status" = Discharging -a "$capacity" -lt 15 ]; then
		notify-send -u critical -a BATTERI "					*********************  ANSLUT STRÖMADAPTER!  *********************					" &
	elif [ "$status" = Discharging -a "$capacity" -lt 5 ]; then
		logger "Inget jädrans batteri!!"
		systemctl hibernate
	fi
}
