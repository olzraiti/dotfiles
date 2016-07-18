#!/bin/bash
while true; do
	scrot ~/tmp/screen/screen.png
	convert ~/tmp/screen/screen.png -scale 10% -scale 1000% ~/tmp/screen/screen.png
	sleep 10
done
