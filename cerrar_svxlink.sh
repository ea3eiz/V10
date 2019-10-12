#!/bin/bash
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_svxlink.desktop /home/pi
sleep 1
sed -i "4cExec=sh -c 'cd /home/pi/$SCRIPTS_version;lxterminal --geometry=72x15 -e sudo sh ejecutar_svxlink.sh'" /home/pi/Abrir_svxlink.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ECHOLINK.png" /home/pi/Abrir_svxlink.desktop
sed -i "10c Name[es_ES]=Abrir SVXLINK" /home/pi/Abrir_svxlink.desktop
sed -i "8c SVXLINK=OFF" /home/pi/status.ini
sleep 1
cd /home/pi
sudo cp Abrir_svxlink.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_svxlink.desktop

sudo killall svxlink

