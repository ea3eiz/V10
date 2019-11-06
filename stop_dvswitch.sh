#!/bin/bash
sudo systemctl stop analog_bridge.service
sudo systemctl stop ircddbgateway.service
sudo systemctl stop md380-emu.service
sudo systemctl stop mmdvm_bridge.service
sudo systemctl stop nxdngateway.service


SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Activar_dvswitch.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh ejecutar_dvswitch.sh'" /home/pi/Activar_dvswitch.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_AMBE_SERVER_OFF.png" /home/pi/Activar_dvswitch.desktop
sed -i "10c Name[es_ES]=Activar Dvswitch" /home/pi/Activar_dvswitch.desktop

cd /home/pi
sudo cp Activar_dvswitch.desktop /home/pi/Desktop
sleep 2
sudo rm /home/pi/Activar_dvswitch.desktop

cd /home/pi/$SCRIPTS_version
sudo sh stop_dvswitch.sh