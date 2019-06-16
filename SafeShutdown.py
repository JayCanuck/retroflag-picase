#!/usr/bin/env python3
from gpiozero import Button, LED
from subprocess import run
import os 
from signal import pause

powerPin = 3 
resetPin = 2 
ledPin = 14 
powerenPin = 4 
hold = 1
led = LED(ledPin)
led.on()
power = LED(powerenPin)
power.on()

#functions that handle button events
def when_pressed():
  led.blink(.2,.2)
  # if RetroArch is active, attempt sending a QUIT command to exit the active game cleanly
  if run(["pidof", "retroarch"]).returncode == 0:
    os.system("echo -n \"QUIT\" | nc -u -w1 127.0.0.1 55355")
  # use es-shutdown flag file to have EmulationStation perform a structured shutdown
  os.system("touch /tmp/es-shutdown && chown pi /tmp/es-shutdown && killall emulationstation")
def when_released():
  led.on()
def reboot():
  # check if a RetroArch game is actively running
  if run(["pidof", "retroarch"]).returncode == 0:
  	# if a game is running, send RESET command to reset the game itself
    os.system("echo -n \"RESET\" | nc -u -w1 127.0.0.1 55355")
  else:
  	# when reset button is pressed from EmulationStation, reset the whole system,
  	# using es-restart flag file to perform a structured restart
    os.system("touch /tmp/es-restart && chown pi /tmp/es-restart && killall emulationstation")
  
btn = Button(powerPin, hold_time=hold)
rebootBtn = Button(resetPin)
rebootBtn.when_pressed = reboot 
btn.when_pressed = when_pressed
btn.when_released = when_released
pause()
