#!/bin/bash
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_solodstar.desktop /home/pi
sleep 1
sed -i "6c Exec=sh -c 'cd /home/pi/$SCRIPTS_version/;lxterminal --geometry=80x20 -e sudo sh ejecutar_solodstar.sh'" /home/pi/Abrir_solodstar.desktop
sed -i "7c Icon=/home/pi/$SCRIPTS_version/SOLO_D-STAR.png" /home/pi/Abrir_solodstar.desktop
sed -i "11c Name[es_ES]=Abrir solo D-STAR" /home/pi/Abrir_solodstar.desktop
sed -i "13c SOLODSTAR=OFF" /home/pi/status.ini
sleep 1
cd /home/pi
sudo cp Abrir_solodstar.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_solodstar.desktop






cd /home/pi/Desktop
sudo cp Abrir_ircDDBGateway.desktop /home/pi
sleep 1
sed -i "4cExec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh ejecutar_d-star.sh'" /home/pi/Abrir_ircDDBGateway.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/DSTAR.png" /home/pi/Abrir_ircDDBGateway.desktop
sed -i "10c Name[es_ES]=Abrir ircDDB" /home/pi/Abrir_ircDDBGateway.desktop
sed -i "1c D-STAR=OFF" /home/pi/status.ini
sleep 1
cd /home/pi
sudo cp Abrir_ircDDBGateway.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_ircDDBGateway.desktop










sudo killall MMDVMDSTAR
sudo killall ircddbgateway
sudo killall MMDVMBM

 