#!/bin/bash

status_dvswitch=$(awk "NR==18" /home/pi/status.ini)
status_dvswitch=`expr substr $status_dvswitch 10 2`
if [ $status_dvswitch = ON ]
then
echo "\033[1;31m" #ROJO
echo "******************************************"
echo "      NO SE PUEDE ABRIR ESTE SISTEMA     *"
echo "       SI ESTA EL DVSWITCH ACTIVADO      *"
echo "******************************************"
sleep 5
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

cd /home/pi/Desktop
sudo cp Abrir_D-STARRepeater.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh cerrar_dstarrepeater.sh'" /home/pi/Abrir_D-STARRepeater.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/REPEATER_ON.png" /home/pi/Abrir_D-STARRepeater.desktop
sed -i "10c Name[es_ES]=Cerrar DSTAR Repeater" /home/pi/Abrir_D-STARRepeater.desktop
sed -i "9c dstarrepeater=ON" /home/pi/status.ini
cd /home/pi
sudo cp Abrir_D-STARRepeater.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_D-STARRepeater.desktop

#sudo ircddbgateway -gui  & dstarrepeater & ircddbgateway -gui
#sudo ircddbgateway -gui  & 
#sleep 2
#sudo dstarrepeater
fi
 

