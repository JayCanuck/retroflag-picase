#!/bin/bash
filewebsite="https://raw.githubusercontent.com/JayCanuck/retroflag-picase/master"
sleep 2s
#Step 1) Check if root--------------------------------------
if [[ $EUID -ne 0 ]]; then
   echo "Please execute script as root." 
   exit 1
fi


#-----------------------------------------------------------

#Step 3) Update repository----------------------------------
sudo apt-get update -y

sleep 2s
#-----------------------------------------------------------

#Step 4) Install gpiozero module----------------------------
sudo apt-get install -y python3-gpiozero

sleep 2s
#-----------------------------------------------------------

#Step 5) Download Python script-----------------------------
cd /opt/
sudo mkdir RetroFlag
cd /opt/RetroFlag
script=SafeShutdown.py

if [ -e $script ];
	then
		echo "Script SafeShutdown.py already exists. Doing nothing."
	else
		wget --no-check-certificate -O  $script "$filewebsite""/SafeShutdown_gpi.py"
fi
#-----------------------------------------------------------
sleep 2s
#Step 6) Enable Python script to run on start up------------
cd /etc/
RC=rc.local

if grep -q "sudo python3 \/opt\/RetroFlag\/SafeShutdown.py \&" "$RC";
	then
		echo "File /etc/rc.local already configured. Doing nothing."
	else
		sed -i -e "s/^exit 0/sudo python3 \/opt\/RetroFlag\/SafeShutdown.py \&\n&/g" "$RC"
		echo "File /etc/rc.local configured."
fi
#-----------------------------------------------------------

#Step 6.5) Enable RetroArch network command API-------------
if [ -f /opt/retropie/configs/all/retroarch.cfg ] ; then
	sed -i '/network_cmd_enable/d' /opt/retropie/configs/all/retroarch.cfg
	sed -i '/network_cmd_port/d' /opt/retropie/configs/all/retroarch.cfg
	echo "network_cmd_enable = true" >> /opt/retropie/configs/all/retroarch.cfg
	echo "network_cmd_port = 55355" >> /opt/retropie/configs/all/retroarch.cfg
fi
#-----------------------------------------------------------

#Step 7) Reboot to apply changes----------------------------
echo "RetroFlag Pi Case installation done. Will now reboot after 3 seconds."
sleep 3s
sudo reboot
#-----------------------------------------------------------









