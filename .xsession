#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?* ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

sxhkd &
display_ports=( "VGA1" "DP1" )
for display_port in "${display_ports[@]}"; do
	if [[ $(xrandr -q | grep $display_port | awk '{print $2}') == "connected" ]]; then
		xrandr --output $display_port --mode $(xrandr -q | grep $display_port -A 1 | tail -n 1 | awk '{print $1}')
		xrandr --output $display_port --primary
		xrandr --output LVDS1 --same-as $display_port
		break
	else
		xrandr --output LVDS1 --primary
	fi
done

cache_xrandr
pia-vpn &
#dunst &
notifyd &
bar_notifyd &
redshift &
sparkleshare start &
compton &
unclutter &
#mpd &
urxvtd -q -f -o &
setxkbmap custom &
(sleep 8
 xset -dpms 
 xset s off  # screen blanking off
 xset -b # audible bell off
 xset r rate 200 25 # key repeat rate
 xset m 3 4 # mouse speed
 custom_keys
 ~/programming/steamcontroller/scripts/custom.py start
 ) &

muttatt &
battery_listener &
listen_battery_fifo &

#exec startxfce4
exec bspwm
