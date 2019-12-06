#!/bin/bash


clear
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
 
sudo cp /home/pi/Desktop/Abrir_D-STARRepeater /home/pi
sed -i "9c Terminal=false" /home/pi/Abrir_D-STARRepeater
sudo cp /home/pi/Abrir_D-STARRepeater /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_D-STARRepeater

sudo cp /home/pi/Desktop/Abrir_ircDDBGateway.desktop /home/pi
sed -i "9c Terminal=false" /home/pi/Abrir_ircDDBGateway.desktop
sudo cp /home/pi/Abrir_ircDDBGateway.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_ircDDBGateway.desktop


clear
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Activar_dvswitch.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh ejecutar_dvswitch.sh'" /home/pi/Activar_dvswitch.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_DVSWITCH_OFF.png" /home/pi/Activar_dvswitch.desktop
sed -i "10c Name[es_ES]=Activar Dvswitch" /home/pi/Activar_dvswitch.desktop

cd /home/pi
sudo cp Activar_dvswitch.desktop /home/pi/Desktop

sudo rm /home/pi/Activar_dvswitch.desktop

sudo systemctl stop ysfgateway.service
sudo systemctl stop dmr2ysf.service

sudo systemctl stop analog_bridge.service
sudo systemctl stop ircddbgateway.service
sudo systemctl stop md380-emu.service
sudo systemctl stop mmdvm_bridge.service
sudo systemctl stop nxdngateway.service

sed -i "18c DVSWITCH=OFF" /home/pi/status.ini