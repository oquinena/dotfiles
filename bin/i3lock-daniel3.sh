#!/bin/bash


# Variables
icon="$HOME/.config/i3/i3lock_icon3.png"
tmpbg="$(mktemp /tmp/screen-XXXXXXXXXX.png)"
i3lock_options="-u -i $tmpbg"

# Run before starting the locker
pre_lock() {
    #mpc pause
    scrot "$tmpbg"
    convert "$tmpbg" -scale 20% -scale 500% -gamma 0.5 "$tmpbg"
    convert -blur 2x3 "$tmpbg"
    convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
    if ( $(ifconfig enp0s31f6 | grep -o UP) ! "UP" ) then  
        sudo umount -f -l /mnt/tv
    fi
    return
}

# Run after the locker exits
post_lock() {
    rm $tmpbg
    #/home/nomad/.config/polybar/launch_polybar.sh & 
    return
}

###############################################################################

pre_lock

# We set a trap to kill the locker if we get killed, then start the locker and
# wait for it to exit. The waiting is not that straightforward when the locker
# forks, so we use this polling only if we have a sleep lock to deal with.
if [[ -e /dev/fd/${XSS_SLEEP_LOCK_FD:--1} ]]; then
    kill_i3lock() {
        pkill -xu $EUID "$@" i3lock
    }

    trap kill_i3lock TERM INT

    # we have to make sure the locker does not inherit a copy of the lock fd
    i3lock $i3lock_options {XSS_SLEEP_LOCK_FD}<&-

    # now close our fd (only remaining copy) to indicate we're ready to sleep
    exec {XSS_SLEEP_LOCK_FD}<&-

    while kill_i3lock -0; do
        sleep 0.5
    done
else
    trap 'kill %%' TERM INT
    i3lock -n $i3lock_options &
    wait
fi

post_lock
