#!/bin/bash
pacmd set-default-sink "jack_out"
killall pulseaudio

jack_connect system:capture_2 system:playback_1
jack_connect system:capture_2 system:playback_2

patchage -A &

sleep 1

jack_connect 'PulseAudio JACK Sink:front-left' system:playback_5
jack_connect 'PulseAudio JACK Sink:front-right' system:playback_6
