#!/bin/bash
pacmd set-default-sink "jack_out"
killall pulseaudio

jack_connect system:capture_2 system:playback_1
jack_connect system:capture_2 system:playback_2

patchage -A &

sleep 1

qsynth &

sleep 5

aconnect 16 128

a2jmidid -e & 1>/dev/null 2>&1
