#!/bin/bash

modo=$(awk "NR==18" /home/pi/status.ini)
if [ "$modo" = 'DVSWITCH=ON' ];then
cd /home/pi/V10
sudo sh ejecutar_bm.sh
else
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_ircDDBGateway.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh cerrar_d-star.sh'" /home/pi/Abrir_ircDDBGateway.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/DSTAR_ON.png" /home/pi/Abrir_ircDDBGateway.desktop
sed -i "10c Name[es_ES]=Cerrar ircDDB" /home/pi/Abrir_ircDDBGateway.desktop
sed -i "1c D-STAR=ON" /home/pi/status.ini
cd /home/pi
sudo cp Abrir_ircDDBGateway.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_ircDDBGateway.desktop

sudo ircddbgateway -gui

fi
