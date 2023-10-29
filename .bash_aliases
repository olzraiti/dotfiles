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
alias json="python -m json.tool"
alias nr="notify-run"
alias nrm="notify-run -m"

function sgrp { 
	dir="src"
	if [[ -f $PWD/.sgrp ]]; then
		dir=$(cat $PWD/.sgrp)
	fi
	[[ -n "$2" ]] && dir="$2"

	grep  "$1" -r $dir --color=always
}

export sgrp
