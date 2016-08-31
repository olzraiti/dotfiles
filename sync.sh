#!/bin/bash
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function install_packages {
	packages=""
	while read line; do
		packages="$packages $line"
	done <<< "$(cat $HOME'/dotfiles/packages')"
	pacaur -Syu --needed --noconfirm $packages
}

echo "Decrypting..."
$dir"/decrypt.sh"

echo "Installing packages"

install_packages

$HOME/dotfiles/link.sh
if ! [[ -f /usr/share/X11/xkb/symbols/custom ]]; then
	sudo cp $HOME/dotfiles/custom /usr/share/X11/xkb/symbols/
fi

ln -s ~/SparkleShare/sparkleshark/.password-store ~/

~/.tmux/plugins/tpm/bin/install_plugins
tmux source ~/.tmux.conf
