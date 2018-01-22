#/bin/bash
alias gopen="gnome-open"
alias xopen="xdg-open"
alias vpn="sudo openvpn /etc/openvpn/openvpn.conf"
alias firefox="env GTK2_RC_FILES=$HOME/.themes/Numix-flatstudio-turquoise/gtk-2.0/gtkrc firefox"
alias shutdown="sudo shutdown -h now"
alias osql="/home/olli/lib/oracleDbSofta/opt/sqldeveloper/sqldeveloper.sh"
alias fuck='eval $(thefuck $(fc -ln -1))'
alias boincd="sudo /etc/init.d/boinc-client"
alias lcd='cd $(ls -tr | tail -1)'
alias psgrep="ps -u $USER | grep"
alias rpsgrep='ps -u root | grep'
alias pi='pacaur -S'
alias pu='pacaur -Syu'
alias ls='ls --color'
alias cal='cal -m'
alias t="todo.sh"
alias torrench="torrench -t --copy"

function sgrp { 
	dir="src"
	[[ -n "$2" ]] && dir="$2"
	grep  "$1" -r $dir
}

export sgrp
