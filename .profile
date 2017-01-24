# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask # for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

#export aliases
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

PATH="$HOME/effect-tools/bin:$PATH"

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export JRE_HOME=/usr/lib/jvm/java-8-openjdk
#export JAVA_HOME=/usr/lib/jvm/default
#export JRE_HOME=/usr/lib/jvm/default
export VISUAL=vim
export EDITOR="$VISUAL"
export BROWSER="qutebrowser"
export BSPWM_SCRIPTS_DIR=$HOME/scripts/bspwm

PATH="$HOME/scripts/quaker:$PATH"

color_fg="#71c2af"
color_icon="#ff6a6a"
export notify_color_fg=$color_fg
export notify_icon_fg=$color_icon
function icon {
	export $1="%{F$color_icon}$2%{F$color_fg}"
}
icon VOL_ICON "\uf028"
icon MUTE_ICON "\uf026×"
icon KEYBOARD_ICON "\uf11c"
icon CLOCK_ICON "\uf017"
icon CALENDAR_ICON "\uf073"
icon REDSHIFT_ICON "\uf042"
icon TV_ICON "\uf26c"
icon BATTERY_ICON "\uf240"
icon BATTERY_4_ICON "\uf240"
icon BATTERY_3_ICON "\uf241"
icon BATTERY_2_ICON "\uf242"
icon BATTERY_1_ICON "\uf243"
icon BATTERY_0_ICON "\uf244"
icon CHORD_PLUGGED "\uf1e6"
icon WIFI_ICON "\uf1eb"
icon WIFI_DISCONNECTED_ICON "\uf1eb ×"
icon DESKTOP_ICON "\uf108"
icon VPN_ICON "\uf0ac"
icon UNLOCKED "\uf084 \uf13e"

eval $(dircolors ~/.dircolors) > /dev/null

if [[ -z $SSH_CONNECTION && -z $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
else
	export GPG_TTY=`tty`
fi
