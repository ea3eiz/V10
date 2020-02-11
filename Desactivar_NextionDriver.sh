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
echo " * Si desactivas NextionDriver funcionará la China pinchada en Raspi *"
echo " *                                                                   *"
echo " *********************************************************************"
echo ""
echo "${CIAN}"
echo -n " Quieres Desactivar NextionDriver S/N ? "
read desactivar
case "$desactivar" in
[sS]* )
clear
echo "${VERDE}"
echo " *********************************************************************"
echo " *                                                                   *"
echo " *     <<<<<<<<      DESACTIVANDO NextionDriver      >>>>>>>>>       *"
echo " *                                                                   *"
echo " *********************************************************************"
sleep 3
sudo sed -i "4c #Exec=sh -c 'cd /home/pi/NextionDriver/;sudo ./NextionDriver -c /home/pi/MMDVMHost/MMDVM.ini'" /home/pi/.config/autostart/nextiondriver.desktop
break;;
[nN]*) 
exit ;;
esac