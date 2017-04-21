#!/bin/sh

wlan="wlp6s0"
signal=0

name="$(nmcli d show $wlan | grep GENERAL.CONNECTION | awk '{ print $2 }')"

ip="$(nmcli d show $wlan | grep IP4.ADDRESS | awk '{ print $2 }')"

strength="$(nmcli --fields SSID,SIGNAL dev wifi list | grep $name | awk '{ print $2 }')"

case $strength in
	[0-20]*)
	signal= 
	;;

	[21-40]*)
	signal= 
	;;

	[41-60]*)
	signal= 
	;;

	[61-80]*)
	signal= 
	;;

	[81-100]*)
	signal=  
	;;
esac

echo $signal $name
