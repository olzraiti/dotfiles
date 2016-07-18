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

export JAVA_HOME=/usr/lib/jvm/default
export JRE_HOME=/usr/lib/jvm/default
export VISUAL=vim
export EDITOR="$VISUAL"
export BROWSER="qutebrowser"
export BSPWM_SCRIPTS_DIR=$HOME/scripts/bspwm

color_fg="#71c2af"
color_icon="#ff6a6a"
export notify_color_fg=$color_fg
export notify_icon_fg=$color_icon
function icon {
	export $1="%{F$color_icon}$2%{F$color_fg}"
}
icon VOL_ICON "\uf028"
icon MUTE_ICON "\uf026x"
icon KEYBOARD_ICON "\uf11c"
icon CLOCK_ICON "\uf017"
icon CALENDAR_ICON "\uf073"
icon REDSHIFT_ICON "\uf042"
icon TV_ICON "\uf26c"
icon VPN_ICON "\uf0ac"
icon UNLOCKED "\uf084 \uf13e"

eval $(dircolors ~/.dircolors) > /dev/null

[[ -z $SSH_CONNECTION && -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
