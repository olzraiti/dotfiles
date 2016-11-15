#!/bin/bash

echo "Symlinking..."

cat $HOME'/dotfiles/symlinks' | while read line; do
	link=$HOME'/'$line
	file=$HOME'/dotfiles/'$line

	if [[ $line == *" "* ]]; then
		link=$HOME'/'$(echo $line | awk '{print $2}')
		file=$HOME'/dotfiles/'$(echo $line | awk '{print $1}')
	fi	

	doLink=true
	doMove=false

	if [[ ! -f $link  && -d $link && $(readlink -f $link) == $link ]]; then
		doMove=true
	fi

	if [[ -f $link  && ! -d $link && $(readlink -f $link) == $link ]]; then
		doMove=true
	fi

	if [[ $(readlink -f $link) == $file ]]; then
		doLink=false
	fi

	if [[ $doLink == true ]]; then
		echo $link" not linked, linking now to $file"
	fi

	if [[ $doMove == true ]]; then
		echo "file exists, creating "$link".old"
		mv $link $link".old"
	fi


	if [[ $doLink == true ]]; then
		mkdir -p $(dirname $link)
		ln -sf $file $link
	fi
done
