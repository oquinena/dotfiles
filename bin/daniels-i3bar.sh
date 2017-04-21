#!/bin/sh
# shell script to prepend i3status with more stuff

i3status | while :
do
        read line
        echo "(xbacklight | awk '{printf("%d\n",$1 + 0.5)}') | $line" || exit 1
done
