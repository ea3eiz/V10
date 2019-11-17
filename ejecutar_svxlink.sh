#!/bin/bash
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_svxlink.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;lxterminal --geometry=72x15 -e sudo sh cerrar_svxlink.sh'" /home/pi/Abrir_svxlink.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ECHOLINK_ON.png" /home/pi/Abrir_svxlink.desktop
sed -i "10c Name[es_ES]=Cerrar SVXLINK" /home/pi/Abrir_svxlink.desktop
sed -i "8c SVXLINK=ON" /home/pi/status.ini
cd /home/pi
sudo cp Abrir_svxlink.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_svxlink.desktop

sudo svxlink