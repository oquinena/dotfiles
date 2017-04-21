#!/bin/bash

nmcli c up Ängkärr --ask
sudo ip route add 192.168.0.4 dev vpn0

