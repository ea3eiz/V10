#!/bin/bash

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
#cierra D-STARRepeater y quita icono verde de "cerrar Cerrar D-STARRepeater"
cd /home/pi/Desktop
sudo cp Abrir_D-STARRepeater.desktop /home/pi
sleep 1
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh ejecutar_dstarrepeater.sh'" /home/pi/Abrir_D-STARRepeater.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/repeater.png" /home/pi/Abrir_D-STARRepeater.desktop
sed -i "10c Name[es_ES]=Abrir DSTAR Repeater" /home/pi/Abrir_D-STARRepeater.desktop
sed -i "9c dstarrepeater=OFF" /home/pi/status.ini
sleep 1
cd /home/pi
sudo cp Abrir_D-STARRepeater.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_D-STARRepeater.desktop
#cierra ircDDBGateway y quita icono verde de "cerrar ircDDB"
cd /home/pi/Desktop
sudo cp Abrir_ircDDBGateway.desktop /home/pi
sed -i "4cExec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh ejecutar_d-star.sh'" /home/pi/Abrir_ircDDBGateway.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/DSTAR.png" /home/pi/Abrir_ircDDBGateway.desktop
sed -i "10c Name[es_ES]=Abrir ircDDB" /home/pi/Abrir_ircDDBGateway.desktop
sed -i "1c D-STAR=OFF" /home/pi/status.ini
cd /home/pi
sudo cp Abrir_ircDDBGateway.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_ircDDBGateway.desktop

#cierra ircDDBGateway
sudo killall ircddbgateway
#cierra remotecontrol
sudo killall remotecontrol
#cierra D-STARRepeater
sudo killall dstarrepeater