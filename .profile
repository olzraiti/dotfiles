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
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export JAVA_HOME=/usr/lib/jvm/default
export JRE_HOME=/usr/lib/jvm/default
export VISUAL=vim
export EDITOR="$VISUAL"
export BROWSER="qutebrowser"
export BSPWM_SCRIPTS_DIR=$HOME/scripts/bspwm

PATH="$HOME/scripts/quakify:$PATH"

eval $(dircolors ~/.dircolors) > /dev/null

if [[ -z $TMUX && -z $SSH_CONNECTION && -z $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
else
	export GPG_TTY=`tty`
fi
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
