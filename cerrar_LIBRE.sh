#!/bin/bash
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_LIBRE.desktop /home/pi
sleep 1
sed -i "4cExec=sh -c 'cd /home/pi/$SCRIPTS_version;lxterminal --geometry=72x15 -e sudo sh ejecutar_LIBRE.sh'" /home/pi/Abrir_LIBRE.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/LIBRE.png" /home/pi/Abrir_LIBRE.desktop
sed -i "10c Name[es_ES]=Abrir LIBRE" /home/pi/Abrir_LIBRE.desktop
sed -i "10c MMDVMLIBRE=OFF" /home/pi/status.ini
sleep 1
cd /home/pi
sudo cp Abrir_LIBRE.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_LIBRE.desktop
killall MMDVMHostLIBRE
