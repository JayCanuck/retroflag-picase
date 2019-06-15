## Forked from https://github.com/RetroFlag/retroflag-picase

Shutdown will save game metadata (not a savestate, just active memory) of any active game and then shutdown the system.
Restart will reset a game itself if one is running. If the system is on EmulationStation, then restart button will restart the whole Pi system.

This fork is similar in ideology to https://github.com/crcerror/retroflag-picase The main difference between this and crcerror's implemention is how things are done.  This fork is meant to to minimalist, relying on RetroArch APIs to exit/reset games and EmulationStation itself to handle the system shutdown/restart (just like if you manually used EmulationStation to initiate a shutdown/restart). Only supports RetroPie at this point.

The RetroArch features naturally only work within RetroArch-based emulators/cores and require the following settings in your RetroArch config (eg. `/opt/retropie/configs/all/retroarch.cfg`):
```
network_cmd_enable = false
network_cmd_port = 55355
```

The script installation is the same as the regular scripts as per instructions below.


# retroflag-gpi case (gpi case only)
Turn switch "SAFE SHUTDOWN" to ON.

For RetroPie:

1. Make sure internet connected.
2. Make sure keyboard connected.
3. Press F4 enter terminal.
4. In the terminal, type the one-line command below(Case sensitive):

wget -O - "https://raw.githubusercontent.com/JayCanuck/retroflag-picase/master/install_gpi.sh" | sudo bash

--------------------
For Recalbox
1. Make sure internet connected.
2. Make sure keyboard connected.
3. Press F4 first. And then press ALT-F2 enter termial.
4. User: root Password: recalboxroot
5. In the terminal, type the one-line command below(Case sensitive):

wget -O - "https://raw.githubusercontent.com/JayCanuck/retroflag-picase/master/recalbox_install_gpi.sh" | bash



# retroflag-picase (nespi+, superpi, megapi case)
RetroFlag Pi-Case Safe Shutdown

Turn switch "SAFE SHUTDOWN" to ON.

--------------------

Example for RetroPie:
1. Make sure internet connected.
2. Make sure keyboard connected.
3. Press F4 enter terminal.
4. In the terminal, type the one-line command below(Case sensitive):

wget -O - "https://raw.githubusercontent.com/JayCanuck/retroflag-picase/master/install.sh" | sudo bash

--------------------

Example for RecalBox:
1. Make sure internet connected.
2. Make sure keyboard connected.
3. Press F4 first. And then press ALT-F2 enter termial.
4. User: root Password: recalboxroot
5. In the terminal, type the one-line command below(Case sensitive):

wget -O - "https://raw.githubusercontent.com/JayCanuck/retroflag-picase/master/recalbox_install.sh" | bash
