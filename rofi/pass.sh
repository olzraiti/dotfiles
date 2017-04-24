#!/usr/bin/env bash

if [[ -n $@ ]]
then
	echo $@ > /tmp/pass_rofi_picked
	clip_pass $@ > /dev/null 2>&1 &
	exit
fi

cat /tmp/pass_rofi_fifo
