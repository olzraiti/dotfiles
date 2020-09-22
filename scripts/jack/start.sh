#!/bin/bash

$HOME/effect-tools/bin/start_jack
#jack_control dps rate 48000
#pacmd set-default-sink "jack_out"
#killall pulseaudio

#jack_connect system:capture_2 system:playback_1
#jack_connect system:capture_2 system:playback_2

#patchage -A &

#qsynth & 1>/dev/null 2>&1
#while [[ -z $(jack_lsp -c | grep '^qsynth') ]]; do
#	echo sleep
#	sleep 1
#done
#aconnect 24 128
a2jmidid -e & 1>/dev/null 2>&1
