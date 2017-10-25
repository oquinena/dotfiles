#!/bin/bash

# Example locker script -- demonstrates how to use the --transfer-sleep-lock
# option with i3lock's forking mode to delay sleep until the screen is locked.

## CONFIGURATION ##############################################################

# Variables
icon="$HOME/.config/i3/i3lock_icon2.png"
tmpbg="$(mktemp /tmp/screen-XXXXXXXXXX.png)"
i3lock_options="-u -i $tmpbg"

# Run before starting the locker
pre_lock() {
    #mpc pause
    scrot "$tmpbg"
    convert "$tmpbg" -scale 5% -scale 2000% "$tmpbg"
    convert -blur 2x3 "$tmpbg"
    convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
    sudo umount -f -l /mnt/dcserver /mnt/tv
    #killall -SIGUSR1 dunst
    return
}

# Run after the locker exits
post_lock() {
    #killall -SIGUSR2 dunst 
    rm $tmpbg
    #sleep 1
    /home/nomad/.config/polybar/launch.sh & 
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
