#/bin/bash
alias install="sudo apt-get install"
alias update="sudo apt-get update"
alias upgrade="sudo apt-get upgrade"
alias gopen="gnome-open"
alias xopen="xdg-open"
alias vpn="sudo openvpn /etc/openvpn/openvpn.conf"
alias firefox="env GTK2_RC_FILES=/home/olli/.themes/Numix-flatstudio-turquoise/gtk-2.0/gtkrc firefox"
alias shutdown="sudo shutdown -h now"
alias osql="/home/olli/lib/oracleDbSofta/opt/sqldeveloper/sqldeveloper.sh"
alias fuck='eval $(thefuck $(fc -ln -1))'
alias boincd="sudo /etc/init.d/boinc-client"
alias sudo='sudo '
alias lcd='cd $(ls -tr | tail -1)'
alias psgrep='ps -u olli | grep'
alias rpsgrep='ps -u root | grep'
alias pi='pacaur -S'
alias pu='pacaur -Syu'
alias ls='ls --color'
alias scrot='scrot'
alias cal='cal -m'
#alias vis='urxvt -e vis'
