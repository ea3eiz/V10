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
echo "SE VAN ACERRAR LOS SISTEMAS:"
echo "****************************"
echo "${VERDE}"
echo "BM"
echo "DMR+"
echo "LIBRE"
echo "RADIO"
echo "solo D-STAR"
echo "solo FUSION"
echo "ircDDB"
echo "D-STAR Repeater"
echo "YSF"
echo "YSF2DMR"
echo "DMR2YSF"
echo "DMR2NXDN"
echo "NXDN"
echo "${BLANCO}"
echo ""
echo "SI ESTAN ABIERTOS"
cd /home/pi/$SCRIPTS_version

bm=$(awk "NR==7" /home/pi/status.ini)
if [ "$bm" = 'MMDVMBM=ON' ];then
sudo sh cerrar_bm.sh
clear
echo "${VERDE}"
echo "+++++++ CERRANDO BM +++++++++++"
fi

plus=$(awk "NR==6" /home/pi/status.ini)
if [ "$plus" = 'MMDVMPLUS=ON' ];then
sudo sh cerrar_DMRPLUS.sh
clear
echo "${VERDE}"
echo "+++++++ CERRANDO DMRPLUS +++++++++++"
fi

libre=$(awk "NR==10" /home/pi/status.ini)
if [ "$libre" = 'MMDVMLIBRE=ON' ];then
sudo sh cerrar_LIBRE.sh
clear
echo "${VERDE}"
echo "+++++++ CERRANDO LIBRE +++++++++++"
fi

radio=$(awk "NR==5" /home/pi/status.ini)
if [ "$radio" = 'MMDVM=ON' ];then
sudo sh cerrar_radio.sh
clear
echo "${VERDE}"
echo "+++++++ CERRANDO RADIO +++++++++++"
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



#sudo sh cerrar_d-star.sh
#clear
#echo "CERRANDO TODOS LOS SISTEMAS"

#sudo sh cerrar_DMR2NXDN.sh
#clear
#echo "CERRANDO TODOS LOS SISTEMAS"

#sudo sh cerrar_DMR2YSF.sh
#clear
#echo "CERRANDO TODOS LOS SISTEMAS"

#sudo sh cerrar_DMRPLUS.sh
#clear
#echo "CERRANDO TODOS LOS SISTEMAS"

#sudo sh cerrar_dstarrepeater_30.sh
#clear
#echo "CERRANDO TODOS LOS SISTEMAS"

#sudo sh cerrar_LIBRE.sh
#clear
#echo "CERRANDO TODOS LOS SISTEMAS"

#sudo sh cerrar_NXDN.sh
#clear
#echo "CERRANDO TODOS LOS SISTEMAS"

#sudo sh cerrar_radio.sh
#clear
#echo "CERRANDO TODOS LOS SISTEMAS"

#sudo sh cerrar_solodstar.sh
#clear
#echo "CERRANDO TODOS LOS SISTEMAS"

#sudo sh cerrar_solofusion.sh
#clear
#echo "CERRANDO TODOS LOS SISTEMAS"

#sudo sh cerrar_ysf.sh
#clear
#echo "CERRANDO TODOS LOS SISTEMAS"

#sudo sh cerrar_YSF2DMR.sh
#clear
#echo "CERRANDO TODOS LOS SISTEMAS"

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

				
						
						