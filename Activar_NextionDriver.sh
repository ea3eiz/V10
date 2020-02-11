#!/bin/bash
#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
echo "${AMARILLO}"
echo " *********************************************************************"
echo " *                                                                   *"
echo " * Si activas NextionDriver no funcionará la China pinchada en Raspi *"
echo " *                                                                   *"
echo " *********************************************************************"
echo ""
echo "${CIAN}"
echo -n " Quieres Activar NextionDriver S/N ? "
read activar
case "$activar" in
[sS]* )
clear
echo "${VERDE}"
echo " *********************************************************************"
echo " *                                                                   *"
echo " * <<<<<<<<<<<<<<<<<< ACTIVANDO NextionDriver >>>>>>>>>>>>>>>>>>>>>> *"
echo " *                                                                   *"
echo " *********************************************************************"
sleep 3


sudo cp /home/pi/Desktop/Activar_NextionDriver.desktop /home/pi
sudo sed -i "4c Exec=sh -c 'cd /home/pi/V10;lxterminal --geometry=72x15 -e sudo sh Desactivar_NextionDriver.sh'"
sudo sed -i "5c Icon=/home/pi/V10/ICONO_AMBE_SERVER_ON.png'"
sudo sed -i "10c Name[es_ES]=Desactivar NextionDriver'"
cd /home/pi
sudo cp Activar_NextionDriver.desktop /home/pi/Desktop




sudo sed -i "4c Exec=sh -c 'cd /home/pi/NextionDriver/;sudo ./NextionDriver -c /home/pi/MMDVMHost/MMDVM.ini'" /home/pi/.config/autostart/nextiondriver.desktop
break;;
[nN]*) 
exit ;;
esac


