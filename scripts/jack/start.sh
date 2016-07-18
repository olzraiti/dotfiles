#!/bin/bash
pacmd set-default-sink "jack_out"
killall pulseaudio

patchage -A &

sleep 1

jack_disconnect system:capture_1 'PulseAudio JACK Source:front-left'
jack_disconnect system:capture_2 'PulseAudio JACK Source:front-right'

jack_connect system:capture_1 system:playback_1
jack_connect system:capture_2 system:playback_2

jack_connect 'PulseAudio JACK Sink:front-left' system:playback_3
jack_connect 'PulseAudio JACK Sink:front-right'  system:playback_4
