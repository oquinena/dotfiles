#xrandr --setprovideroutputsource modesetting NVIDIA-0
#xrandr --auto

xrandr --dpi 192 
export GDK_SCALE=2 
xcalib -d :0 ~/.config/P50_4k.icm 

# Touchpad config
#xinput --set-prop 13 "libinput Tapping Enabled" 1 &
#xinput --set-prop 13 "libinput Natural Scrolling Enabled" 1 & 
#xinput --set-prop 13 "libinput Accel Speed" 0.7 &

#xinput --set-prop 11 "Device Enabled" 0 & # Turn off the bloody touchscreen

# Powersaving off 
xset -dpms
xset s off
xset -b

setxkbmap -option terminate:ctrl_alt_bksp
setxbkmap se
#/home/nomad/bin/bluetooth-lock.py & #Lock screen when phone is not pinged

###### For gnome-keyring to work #######
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources # Add colorscheme from .Xresources
feh --bg-scale /home/nomad/Pictures/Wallpapers/Simple/firewatch.jpg & # Set wallpaper
wal -a 85 -i /home/nomad/Pictures/Wallpapers/Simple/firewatch.jpg & # Testing, applying colorscheme from pywal
#redshift-gtk -l 59.334591:18.063240 & # Change color temp based on location

WM=${3:-bspwm}

case $WM in

	awesome)
	###### AwesomeWM ######
		#compton -f -b -c -C --backend glx &
		exec awesome
		;;
	i3)
	###### I3-Gaps ######
		xset s 600 &
		xss-lock -l -- $HOME/bin/i3lock-daniel3.sh &
		#compton -f -b -c -C --backend glx &
		exec i3 --shmlog-size=26214400 &
		;;
	bspwm)
	###### Bspwm ######
		sxhkd &
		polybar daniels &
		twmnd &
		nm-applet &
		#clipit &
		blueman-applet &
		xset s 600 &
		xss-lock -l -- $HOME/bin/i3lock-daniel3.sh &
		compton --config /home/nomad/.config/compton/compton.conf.20170903 & # compositor 
		xsetroot -cursor_name left_ptr &
		/home/nomad/bin/toggle_touchpad.sh &
		exec bspwm
		;;
	gnome)
	###### Gnome ######
		exec gnome-session
		;;
	xmonad)
	###### XMonad #####
		xsetroot -cursor_name left_ptr &
		xmobar 
		exec /usr/bin/xmonad
		;;
esac
