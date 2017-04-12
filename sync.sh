#!/bin/bash
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function install_packages {
	packages=""
	while read package; do
		[[ -z $(pacman -Q $package) ]] && packages="$packages $package"
	done <<< "$(cat $HOME'/dotfiles/packages')"
	[[ -n $packages ]] && pacaur -Syyu --noconfirm $packages
}

echo "Decrypting..."
$dir"/decrypt.sh"

sudo reflector --sort rate  -f 5 -l 5  --save /etc/pacman.d/mirrorlist  

echo "Installing packages"

install_packages

echo "Updating packages"

pacaur -Syu --noconfirm

$HOME/dotfiles/link.sh

sudo cp $HOME/dotfiles/us_custom /usr/share/X11/xkb/symbols/
sudo cp $HOME/dotfiles/fi_custom /usr/share/X11/xkb/symbols/

#ln -s ~/SparkleShare/sparkleshark/.password-store ~/

~/.tmux/plugins/tpm/bin/install_plugins
tmux source ~/.tmux.conf

vim +PlugInstall +qa! 

xrdb .Xresources
