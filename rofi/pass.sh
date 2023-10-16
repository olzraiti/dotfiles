#!/usr/bin/env bash

if [[ -n $@ ]]
then
	echo $@ > /dev/shm/pass_rofi_picked
	clip-pass $@ > /dev/null 2>&1 &
	exit
fi

cat /dev/shm/pass_rofi_fifo
