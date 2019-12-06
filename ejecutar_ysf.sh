#!/bin/bash

modo=$(awk "NR==18" /home/pi/status.ini)
if [ "$modo" = 'DVSWITCH=ON' ];then
echo "\033[1;31m" #ROJO
echo "******************************************"
echo "      NO SE PUEDE ABRIR ESTE SISTEMA     *"
echo "       SI ESTA EL DVSWITCH ACTIVADO      *"
echo "******************************************"
sleep 5
else
echo "***********************************************"
echo "*             ABRIENDO YSF                    * "
echo "***********************************************"
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_YSF.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;lxterminal --geometry=72x15 -e sudo sh cerrar_ysf.sh'" /home/pi/Abrir_YSF.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/YSF_ON.png" /home/pi/Abrir_YSF.desktop
sed -i "10c Name[es_ES]=Cerrar YSF" /home/pi/Abrir_YSF.desktop
sed -i "3c YSF=ON" /home/pi/status.ini
cd /home/pi
sudo cp Abrir_YSF.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_YSF.desktop

cd /home/pi/YSFClients/YSFGateway
echo "\33[1;32m"
clear
echo "***********************************************"
echo "*             ABRIENDO YSF                    * "
echo "***********************************************"
sleep 1
echo "\33[1;33m"
sudo ./YSFGateway YSFGateway.ini
fi





