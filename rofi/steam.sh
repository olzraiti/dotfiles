#!/usr/bin/env bash

if [[ -n $@ ]]
then
	if [[ $@ == "steam" ]]; then
		coproc (
			/home/olli/programming/steamcontroller/scripts/custom.py stop 2>&1 >/dev/null
			STEAM_RUNTIME=0 steam -tenfoot 2>&1 >/dev/null
			/home/olli/programming/steamcontroller/scripts/custom.py start 2>&1 >/dev/null
		)
	elif [[ $@ == "zsnes" ]]; then
		coproc (
			/home/olli/programming/steamcontroller/scripts/custom.py stop 2>&1 >/dev/null
			/home/olli/programming/steamcontroller/scripts/snes.py start 2>&1 >/dev/null
			zsnes 2>&1 >/dev/null
			/home/olli/programming/steamcontroller/scripts/snes.py stop 2>&1 >/dev/null
			/home/olli/programming/steamcontroller/scripts/custom.py start 2>&1 >/dev/null
		)
	fi
	exit
fi

echo "steam"
echo "zsnes"
