#!/bin/bash
ssh robopop "[[ -d /tmp/muttattach ]] || mkdir /tmp/muttattach"
ssh robopop "touch /tmp/muttattach/filename_fifo"
ssh robopop "tail -f -n 0 /tmp/muttattach/filename_fifo" | while read line; do
	if [[ $(ssh robopop 'cat /tmp/muttclienthost') != $HOSTNAME ]]; then
		continue
	fi
	file=$(basename $line)
	notify-send "Fetching" "$file"
	scp robopop:/tmp/muttattach/$file /tmp/
	ssh robopop "rm /tmp/muttattach/$file" &
	xdg-open /tmp/$file
	! zenity --question --text "Keep the file?" && sleep 2 && rm /tmp/$file
done
