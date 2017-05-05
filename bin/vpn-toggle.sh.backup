#!/bin/bash

wlan="wlp6s0"

vpn="$(nmcli | grep "VPN connection" | awk '{print $1}')"
connection="$(nmcli d show $wlan | grep GENERAL.CONNECTION | awk '{ print $2 }')"

if [ $connection == "88775469" ] || [ $connection == "88775470" ] 
 then
	nmcli c up Ängkärr 
	sudo ip route add 192.168.0.4 dev vpn0  
fi

if [ $connection == "Angkarrskolan" ] 
 then
	nmcli c up Hemma
	sudo ip route add 192.168.2.2 dev ppp0
fi


