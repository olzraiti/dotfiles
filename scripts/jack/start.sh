#!/bin/bash
pacmd set-default-sink "jack_out"
killall pulseaudio

jack_connect system:capture_2 system:playback_1
jack_connect system:capture_2 system:playback_2

patchage -A &

sleep 1

qsynth &

jack_connect 'PulseAudio JACK Sink:front-left' system:playback_5
jack_connect 'PulseAudio JACK Sink:front-right' system:playback_6

sleep 5

aconnect 16 128

a2midid -e & > /tmp/a2mididoutput
