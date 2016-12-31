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
xrandr --output DVI-1 --primary
xrandr --output HDMI-0 --right-of DVI-1
xrandr --output HDMI-0 --same-as DVI-1
cache_xrandr
pia-vpn &
notifyd &
bar_notifyd &
redshift &
sparkleshare start &
darkhttpd /var/cache/pacman/pkg &
compton &
unclutter &
mpd &
urxvtd -q -f -o &
setxkbmap us_custom &
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

exec bspwm
