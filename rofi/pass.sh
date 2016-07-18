#!/usr/bin/env bash

if [[ -n $@ ]]
then
	coproc (clip_pass $@ > /dev/null 2>&1)
	echo $@ > /tmp/pass_rofi_picked
	exit
fi

cat /tmp/pass_rofi_fifo
