#!/bin/bash
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Activar_dvswitch.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;lxterminal --geometry=72x15 -e sudo sh stop_dvswitch.sh'" /home/pi/Activar_dvswitch.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_AMBE_SERVER_ON.png" /home/pi/Activar_dvswitch.desktop
sed -i "10c Name[es_ES]=Cerrar AMBE SERVER" /home/pi/Activar_dvswitch.desktop

cd /home/pi
sudo cp Activar_dvswitch.desktop /home/pi/Desktop
sleep 2
sudo rm /home/pi/Activar_dvswitch.desktop

cd /home/pi/$SCRIPTS_version
sudo sh Activar_dvswitch.sh

				
						
						