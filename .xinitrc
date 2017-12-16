xrandr --dpi 192 
export GDK_SCALE=2 
xcalib -d :0 ~/.config/P50_4k.icm 

# Powersaving off 
#xset -dpms
xset s off
xset -b

setxkbmap -option terminate:ctrl_alt_bksp
sudo numlock

###### For gnome-keyring to work #######
#dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources # Add colorscheme from .Xresources
# wal -a 85 -i "/home/nomad/Pictures/Wallpapers/Simple/firewatch.jpg" & # Testing, applying colorscheme from pywal
wal -a 90 -i /home/nomad/Pictures/Wallpapers/Landscape/a751nirqc7001.jpg
#redshift-gtk -l 59.334591:18.063240 & # Change color temp based on location

# start urxvt-daemon
urxvtd -q -f -o

WM=${4:-xmonad}

case $WM in

	awesome)
	###### AwesomeWM ######
	compton -f -b -c -C --backend glx &
		exec awesome
		;;
    i3)
	###### I3-Gaps ######
		xset s 600 &
		xss-lock -l -- $HOME/bin/i3lock-daniel3.sh &
		polybar daniels &
		twmnd &
		nm-applet &
        clipit &
		compton --config /home/nomad/.config/compton/compton.conf.20170903 & # compositor 
		/home/nomad/bin/toggle_touchpad.sh &
		exec i3 
		;;
	bspwm)
	###### Bspwm ######
		sxhkd &
		polybar daniels &
		twmnd &
		nm-applet &
		clipit &
		blueman-applet &
		xset s 600 &
		xss-lock -l -- $HOME/bin/i3lock-daniel3.sh &
		compton --config /home/nomad/.config/compton/compton.conf.20170903 & # compositor 
		xsetroot -cursor_name left_ptr &
		/home/nomad/bin/toggle_touchpad.sh &
		exec bspwm
		;;
	xmonad)
	###### XMonad #####
		xsetroot -cursor_name left_ptr &
		compton --config /home/nomad/.config/compton/compton.conf.20170903 & # compositor 
		#xmobar &
		#/home/nomad/bin/toggle_touchpad.sh &
		exec /usr/bin/xmonad
		;;
    dwm)
    #### dwm;) #####
        polybar daniels &
		twmnd &
		nm-applet &
		compton --config /home/nomad/.config/compton/compton.conf.20170903 &
		xsetroot -cursor_name left_ptr &
		/home/nomad/bin/toggle_touchpad.sh &
       exec dwm
        ;;
esac
