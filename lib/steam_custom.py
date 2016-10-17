#!/usr/bin/env python

# The MIT License (MIT)
#
# Copyright (c) 2015 Paul Wachendorf <paul.wachendorf@web.de>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

"""Steam Controller Callback Mode example"""
import sys
import subprocess
import time
from enum import Enum
import asyncio
from threading import Thread
import pyautogui

from steamcontroller import SteamController, SCButtons
from steamcontroller.events import EventMapper, Pos
from steamcontroller.uinput import Keys
from steamcontroller.daemon import Daemon

def invoke(cmd): 
	return subprocess.Popen(cmd.split())

def get_output(cmd):
	return subprocess.check_output(cmd.split()).decode("ascii")

def milliseconds():
    return time.time() * 1000

event_data = {
    "pressed": False,
    "start_timer": None,
    "repeat_timer": None
}

listener = {}

def update_event(evm, btn, pressed):
    global listener
    listener[btn.name]["pressed"] = pressed


repeat_treshold = 200
repeat_rate = 250

keyboard_on = False
keyboard_timer = 0
def keyboard(evm):
    global keyboard_on
    global keyboard_timer
    
    curr_millis = milliseconds()
    time_ok = milliseconds() - keyboard_timer > 1000

    if keyboard_on and time_ok:
        invoke("pkill onboard")
        keyboard_on = False
        keyboard_timer = milliseconds()
    elif time_ok:
        window_pid = None
        try:
            window_pid = get_output("xdotool getactivewindow")
        except:
            pass
        invoke("onboard -s 1920x400 -x 0 -y 680 -t Nightshade -l 'Full Keyboard'")
        if window_pid:
            time.sleep(0.2)
            invoke("xdotool windowactivate {0}".format(window_pid))
        keyboard_on = True
        keyboard_timer = milliseconds()

y_pressed=False
def y_callback(pressed):
    global y_pressed
    y_pressed = pressed

hold = {}
def hold_callback(pressed, btn, key):
    global hold
    if (btn not in hold):
        hold[btn] = False
    if pressed and not hold[btn]:
        invoke("xdotool keydown {0}".format(key))
    elif hold[btn] and not pressed:
        invoke("xdotool keyup {0}".format(key))
    hold[btn] = pressed

dir_to_hjkl = {
    "UP": "k",
    "DOWN": "j",
    "LEFT": "h",
    "RIGHT": "l"
}

def dir_command(dir):
    global y_pressed, dir_to_hjkl
    print(y_pressed)
    if y_pressed:
        invoke("xdotool key ctrl+alt+{}".format(dir_to_hjkl[dir]))
    else:
        pyautogui.press(dir.lower())

directions = ["UP", "DOWN", "LEFT", "RIGHT"]

for key in directions:
    listener[key] = event_data.copy()

stick_treshold = 3000
def sticks(evm, x, y):
    global directions, listener, stick_treshold

    dir_pressed = None
    if x < -stick_treshold:
        dir_pressed = "LEFT"
    elif x > stick_treshold:
        dir_pressed = "RIGHT"
    if y < -stick_treshold:
        dir_pressed = "DOWN"
    elif y > stick_treshold:
        dir_pressed = "UP"

    for direction in directions:
        listener[direction]["pressed"] = (direction == dir_pressed)

@asyncio.coroutine
def enter_loop():
    while True:
        global listener, repeat_treshold, repeat_rate
        for btn in listener:
            event_data = listener[btn]
            pressed = event_data["pressed"]
            start_timer = event_data["start_timer"]
            repeat_timer = event_data["repeat_timer"]

            if pressed and start_timer == None:
                event_data["start_timer"] = milliseconds()
                if "start_stop" in event_data: event_data["start_stop"](True, btn)
                if "command" in event_data: event_data["command"]()
            elif pressed and start_timer:
                if milliseconds() - start_timer >= repeat_treshold:
                    if repeat_timer == None or milliseconds() - repeat_timer >= repeat_rate:
                        if "command" in  event_data: event_data["command"]()
                        event_data["repeat_timer"] = milliseconds()
            else:
                event_data["start_timer"] = None
                event_data["repeat_timer"] = None
                if "start_stop" in event_data:
                    event_data["start_stop"](False, btn)
        time.sleep(0.1)

def loop_in_thread(loop):
    asyncio.set_event_loop(loop)
    loop.run_until_complete(enter_loop())

def evminit():
    global listener
    evm = EventMapper()

    #for enum in to_listen:
    for enum in SCButtons:
        listener[enum.name] = event_data.copy()
        evm.setButtonCallback(enum, update_event)

    listener["A"]["command"] = lambda: invoke("xdotool key Return")
    listener["B"]["command"] = lambda: invoke("xdotool key BackSpace")
    listener["X"]["command"] = lambda: invoke("xdotool key Escape")
    listener["STEAM"]["command"] = lambda: invoke("rofi -show Start:~/dotfiles/rofi/steam.sh")
    listener["LB"]["command"] = lambda: invoke("xdotool key XF86AudioLowerVolume")
    listener["RB"]["command"] = lambda: invoke("xdotool key XF86AudioRaiseVolume")
    listener["RPAD"]["command"] = lambda: invoke("xdotool click 2")
    listener["Y"]["start_stop"] = lambda press, btn: y_callback(press)
    listener["RGRIP"]["start_stop"] = lambda pressed, btn: hold_callback(pressed, btn, "ctrl")
    listener["LGRIP"]["start_stop"] = lambda pressed, btn: hold_callback(pressed, btn, "shift")
    listener["LPAD"]["start_stop"] = lambda pressed, btn: hold_callback(pressed, btn, "super")
    listener["UP"]["command"] = lambda: dir_command("UP")
    listener["DOWN"]["command"] = lambda: dir_command("DOWN")
    listener["LEFT"]["command"] = lambda: dir_command("LEFT")
    listener["RIGHT"]["command"] = lambda: dir_command("RIGHT")

    evm.setPadMouse(Pos.RIGHT)
    evm.setPadScroll(Pos.LEFT)
    evm.setTrigButton(Pos.LEFT, Keys.BTN_RIGHT)
    evm.setTrigButton(Pos.RIGHT, Keys.BTN_LEFT)
    evm.setStickAxesCallback(sticks)
    evm.setStickPressedCallback(keyboard)

    loop = asyncio.get_event_loop()

    t = Thread(target=loop_in_thread, args=(loop,))
    t.start()

    return evm

class SCDaemon(Daemon):
    def run(self):
        evm = evminit()
        sc = SteamController(callback=evm.process)
        sc.run()

if __name__ == '__main__':
    import argparse

    def _main():
        parser = argparse.ArgumentParser(description=__doc__)
        parser.add_argument('command', type=str, choices=['start', 'stop', 'restart', 'debug'])
        args = parser.parse_args()
        daemon = SCDaemon('/tmp/steamcontroller.pid')

        if 'start' == args.command:
            daemon.start()
        elif 'stop' == args.command:
            daemon.stop()
        elif 'restart' == args.command:
            daemon.restart()
        elif 'debug' == args.command:
            try:
                evm = evminit()
                sc = SteamController(callback=evm.process)
                sc.run()
            except KeyboardInterrupt:
                return

    _main()
