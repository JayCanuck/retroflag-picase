#!/usr/bin/env python3
from gpiozero import Button, LED
from subprocess import run
import os 
from signal import pause

powerPin = 26 
powerenPin = 27 
hold = 1
power = LED(powerenPin)
power.on()

#functions that handle button events
def when_pressed():
  if run(["pidof", "retroarch"]).returncode == 0:
    os.system("echo -n \"QUIT\" | nc -u -w1 127.0.0.1 55355")
  os.system("touch /tmp/es-shutdown && chown pi /tmp/es-shutdown && killall emulationstation")
  
btn = Button(powerPin, hold_time=hold)
btn.when_pressed = when_pressed
pause()
