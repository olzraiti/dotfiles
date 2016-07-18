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

if [[ $(xrandr -q | grep VGA1 | awk '{print $2}') == "connected" ]]; then
	xrandr --output VGA1 --mode $(xrandr -q | grep VGA -A 1 | tail -n 1 | awk '{print $1}')
	xrandr --output VGA1 --primary
	xrandr --output LVDS1 --same-as VGA1
else
	xrandr --output LVDS1 --primary
fi

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
 custom_keys) &

muttatt &
battery_listener &

#exec startxfce4
exec bspwm
