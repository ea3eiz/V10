#!/bin/bash

#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
echo "${BLANCO}"
echo "   ****************************************************************"
echo "   * SI ACTIVAMOS EL DVSWITCH SE CERRARAN LOS SISTEMAS SIGUIENTES *"
echo "   *       Y NO SE PODRAN VOLVER A UTILIZAR HASTA QUE NO          *"
echo "   *                    CERREMOS EL DVSWITCH                      *"
echo "   ****************************************************************"
echo "${VERDE}"
echo "   BM"
echo "   DMR+"
echo "   LIBRE"
echo "   RADIO"
echo "   solo D-STAR"
echo "   solo FUSION"
echo "   ircDDB"
echo "   D-STAR Repeater"
echo "   YSF"
echo "   YSF2DMR"
echo "   DMR2YSF"
echo "   DMR2NXDN"
echo "   NXDN"
echo "${CIAN}"
echo -n "   "

read -p 'Quieres activar DVSWITCH? S/N ' seguir   
if [ "$seguir" = 'S' -o "$seguir" = 's' ];then 


sudo cp /home/pi/Desktop/Abrir_D-STARRepeater /home/pi
sed -i "9c Terminal=true" /home/pi/Abrir_D-STARRepeater
sudo cp /home/pi/Abrir_D-STARRepeater /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_D-STARRepeater

sudo cp /home/pi/Desktop/Abrir_ircDDBGateway.desktop /home/pi
sed -i "9c Terminal=true" /home/pi/Abrir_ircDDBGateway.desktop
cd 
sudo cp /home/pi/Abrir_ircDDBGateway.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_ircDDBGateway.desktop



cd /home/pi/$SCRIPTS_version
bm=$(awk "NR==7" /home/pi/status.ini)
if [ "$bm" = 'MMDVMBM=ON' ];then
sudo sh cerrar_bm.sh
clear
echo "${VERDE}"
echo "*******************************"
echo "         CERRANDO BM"
echo "*******************************"
fi

plus=$(awk "NR==6" /home/pi/status.ini)
if [ "$plus" = 'MMDVMPLUS=ON' ];then
sudo sh cerrar_DMRPLUS.sh
clear
echo "${VERDE}"
echo "*******************************"
echo "        CERRANDO BM"
echo "*******************************"
fi

libre=$(awk "NR==10" /home/pi/status.ini)
if [ "$libre" = 'MMDVMLIBRE=ON' ];then
sudo sh cerrar_LIBRE.sh
clear
echo "${VERDE}"
echo "*******************************"
echo "        CERRANDO LIBRE"
echo "*******************************"
fi

radio=$(awk "NR==5" /home/pi/status.ini)
if [ "$radio" = 'MMDVM=ON' ];then
sudo sh cerrar_radio.sh
clear
echo "${VERDE}"
echo "*******************************"
echo "       CERRANDO RADIO"
echo "*******************************"
fi

solodstar=$(awk "NR==13" /home/pi/status.ini)
if [ "$solodstar" = 'SOLODSTAR=ON' ];then
sudo sh cerrar_solodstar.sh
clear
echo "${VERDE}"
echo "*******************************"
echo "    CERRANDO solo D-STAR"
echo "*******************************"
fi

solofusion=$(awk "NR==12" /home/pi/status.ini)
if [ "$solofusion" = 'SOLOFUSION=ON' ];then
sudo sh cerrar_solofusion.sh
clear
echo "${VERDE}"
echo "*******************************"
echo "     CERRANDO solo FUSION"
echo "*******************************"
fi

ircDDB=$(awk "NR==1" /home/pi/status.ini)
if [ "$ircDDB" = 'D-STAR=ON' ];then
sudo sh cerrar_d-star.sh
clear
echo "${VERDE}"
echo "*******************************"
echo "CERRANDO ircDDB & DstarRepeater"
echo "*******************************"
fi

DstarRepeater=$(awk "NR==9" /home/pi/status.ini)
if [ "$DstarRepeater" = 'dstarrepeater=ON' ];then
sudo sh cerrar_dstarrepeater_30.sh
clear
echo "${VERDE}"
echo "*******************************"
echo "    CERRANDO DstarRepeater"
echo "*******************************"
fi

ysf2dmr=$(awk "NR==14" /home/pi/status.ini)
if [ "$ysf2dmr" = 'YSF2DMR=ON' ];then
sudo sh cerrar_YSF2DMR.sh
clear
echo "${VERDE}"
echo "*******************************"
echo "      CERRANDO YSF2DMR"
echo "*******************************"
fi

dmr2ysf=$(awk "NR==15" /home/pi/status.ini)
if [ "$dmr2ysf" = 'DMR2YSF=ON' ];then
sudo sh cerrar_DMR2YSF.sh
clear
echo "${VERDE}"
echo "*******************************"
echo "      CERRANDO DMR2YSF"
echo "*******************************"
fi

dmr2nxdn=$(awk "NR==16" /home/pi/status.ini)
if [ "$dmr2nxdn" = 'DMR2NXDN=ON' ];then
sudo sh cerrar_DMR2NXDN.sh
clear
echo "${VERDE}"
echo "*******************************"
echo "      CERRANDO DMR2NXDN"
echo "*******************************"
fi

nxdn=$(awk "NR==17" /home/pi/status.ini)
if [ "$nxdn" = 'NXDN=ON' ];then
sudo sh cerrar_NXDN.sh
clear
echo "${VERDE}"
echo "*******************************"
echo "CERRANDO NXDN"
echo "*******************************"
fi

#01-D-STAR=OFF
#02-BlueDV=OFF
#03-YSF=OFF
#04-DV4mini=OFF
#05-MMDVM=OFF
#06-MMDVMPLUS=OFF
#07-MMDVMBM=OFF
#08-SVXLINK=OFF
#09-dstarrepeater=OFF
#10-MMDVMLIBRE=OFF
#11-AMBE_SERVER=OFF
#12-SOLOFUSION=OFF
#13-SOLODSTAR=OFF
#14-YSF2DMR=OFF
#15-DMR2YSF=OFF
#16-DMR2NXDN=OFF
#17-NXDN=OFF


sleep 2

cd /home/pi/Desktop
sudo cp Activar_dvswitch.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh stop_dvswitch.sh'" /home/pi/Activar_dvswitch.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_DVSWITCH_ON.png" /home/pi/Activar_dvswitch.desktop
sed -i "10c Name[es_ES]=Parar Dvswitch" /home/pi/Activar_dvswitch.desktop

cd /home/pi
sudo cp Activar_dvswitch.desktop /home/pi/Desktop
sleep 2
sudo rm /home/pi/Activar_dvswitch.desktop

sudo systemctl restart ysfgateway.service
sudo systemctl restart dmr2ysf.service

sudo systemctl restart analog_bridge.service
sudo systemctl restart ircddbgateway.service
sudo systemctl restart md380-emu.service
sudo systemctl restart mmdvm_bridge.service
sudo systemctl restart nxdngateway.service


clear
echo "${BLANCO}"
echo "   ***************************************************************************"
echo "   ***************************************************************************"					
echo "   ***************************************************************************"
echo "   ***************************************************************************"
echo "   ***************************************************************************"
echo "   ***************************************************************************"
echo "   ***************************************************************************"
echo "   ***************************************************************************"
echo "   ***************************************************************************"
echo "   ***************************************************************************"
echo "   *                                                                         *"
echo -n "${VERDE}"
echo "   *                      SE HA ACTIVADO DVSWITCH                            *"
echo "   *                                                                         *"
echo -n "${BLANCO}"
echo "   ***************************************************************************"	
echo "   ***************************************************************************"
echo "   ***************************************************************************"
echo "   ***************************************************************************"
echo "   ***************************************************************************"					
echo "   ***************************************************************************"
echo "   ***************************************************************************"
echo "   ***************************************************************************"
echo "   ***************************************************************************"
echo "   ***************************************************************************"

sed -i "18c DVSWITCH=ON" /home/pi/status.ini


sleep 3		
fi				