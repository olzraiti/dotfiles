#!/bin/bash
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function install_packages {
	packages=""
	while read line; do
		packages="$packages $line"
	done <<< "$(cat $HOME'/dotfiles/packages')"
	pacaur -Syyu --noconfirm $packages
}

echo "Decrypting..."
$dir"/decrypt.sh"

echo "Installing packages"

install_packages

$HOME/dotfiles/link.sh

sudo cp $HOME/dotfiles/us_custom /usr/share/X11/xkb/symbols/
sudo cp $HOME/dotfiles/fi_custom /usr/share/X11/xkb/symbols/

ln -s ~/SparkleShare/sparkleshark/.password-store ~/

~/.tmux/plugins/tpm/bin/install_plugins
tmux source ~/.tmux.conf

xrdb .Xresources
