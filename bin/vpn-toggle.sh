#!/bin/bash

wlan="wlp4s0"

vpn="$(nmcli | grep "VPN connection" | awk '{print $1}')"
connection="$(nmcli d show $wlan | grep GENERAL.CONNECTION | awk '{ print $2 }')"

if [ $connection == "88775469" ] || [ $connection == "88775470" ] 
 then
	nmcli c up Angkarr 
	sudo ip route add 192.168.0.4 dev vpn0  
elif [ $connection == "Angkarrskolan" ] || [ $connection == "Angkarrskolan Ethernet" ]
 then
	nmcli c up Hemma
	sudo ip route add 192.168.2.2 dev ppp0
else
	nmcli c up Angkarr
	sudo ip route add 192.168.0.4 dev vpn0
	nmcli c up Hemma
	sudo ip route add 192.168.2.2 dev ppp0
fi


