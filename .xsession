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

xrandr --output DVI-1 --primary
xrandr --output HDMI-0 --right-of DVI-1
xrandr --output HDMI-0 --same-as DVI-1
cache_xrandr
amixer -c 1 set Master 80% &
pia-vpn &
notifyd &
bar_notifyd &
redshift &
sparkleshare start &
darkhttpd /var/cache/pacman/pkg  --port 8004 &
compton &
unclutter &
mpd &
urxvtd -q -f -o &
setxkbmap us_custom &
(sleep 8
 custom_keys
 ~/programming/steamcontroller/scripts/custom.py start
 ) &

function restore_alsa {
	while [ -z "$(pidof pulseaudio)" ]; do
		sleep 0.5
	done
	sleep 0.5
	amixer -c 1 set Master 80%
}

restore_alsa

muttatt &

exec bspwm
