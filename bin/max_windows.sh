#!/bin/bash
maxdesks=3
eval $4
desktop="${desktop:-focused}" desktop_ct=$(bspc query -D | wc -l) i=1
checkdesk(){ [ $(bspc query -N -n .window.\!hidden -d "$desktop" | wc -l) -lt $maxdesks ]; }
until checkdesk; do
    desktop="$(bspc query -D -d "${desktop}#next")"
    [ $(((i++)%desktop_ct)) -eq 0 ] && ((maxdesks++))
done
echo "desktop=$desktop"
