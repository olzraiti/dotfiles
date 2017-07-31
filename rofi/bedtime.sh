#!/usr/bin/env bash

if [[ -n $@ ]]
then
	alarm "$@"
	notify "Alarm set to $@"
	exit
fi

tac ~/.alarm_times | tail -n 4
