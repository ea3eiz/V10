#!/bin/bash

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
version=`expr substr $SCRIPTS_version 2 2`
AUTOARRANQUE="AUTOARRANQUE"
AUTOARRANQUE=$AUTOARRANQUE$SCRIPTS_version

ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
echo "${VERDE}"
echo "     *********************************"
echo "     * ACTUALIZANDO POSIBLES CAMBIOS *"
echo "     *     EN LA IMAGEN V.02.07.$version   *"
echo "     *********************************"
sleep 2
#Actualiza reflectores
                        cd /usr/local/share/opendv/
                        sudo curl --fail -o DExtra_Hosts.txt -s http://www.pistar.uk/downloads/DExtra_Hosts.txt
                        sudo curl --fail -o DCS_Hosts.txt -s http://www.pistar.uk/downloads/DCS_Hosts.txt
                        sudo curl --fail -o DPlus_Hosts.txt -s http://www.pistar.uk/downloads/DPlus_Hosts.txt
                        sudo cp DExtra_Hosts.txt /home/pi/dv4mini/xref.ip
#Actualiza IMAGEN
                        cd /home/pi/$SCRIPTS_version
                        git pull
                        sleep 1

#Lee el fichero INFO_RXF para poner los datos en los iconos INFO TXF                        
frecuencia=$(awk "NR==1" /home/pi/INFO_RXF)
cd /home/pi/Desktop/
sudo cp RXF_BM.desktop /home/pi/
sed -i "11c Name=$frecuencia" /home/pi/RXF_BM.desktop
cd /home/pi
sudo cp RXF_BM.desktop /home/pi/Desktop
sudo rm /home/pi/RXF_BM.desktop

frecuencia=$(awk "NR==2" /home/pi/INFO_RXF)
cd /home/pi/Desktop/
sudo cp RXF_DMRPLUS.desktop /home/pi/
sed -i "11c Name=$frecuencia" /home/pi/RXF_DMRPLUS.desktop
cd /home/pi
sudo cp RXF_DMRPLUS.desktop /home/pi/Desktop
sudo rm /home/pi/RXF_DMRPLUS.desktop

frecuencia=$(awk "NR==14" /home/pi/INFO_RXF)
cd /home/pi/Desktop/
sudo cp RXF_DMR2YSF.desktop /home/pi/
sed -i "11c Name=$frecuencia" /home/pi/RXF_DMR2YSF.desktop
cd /home/pi
sudo cp RXF_DMR2YSF.desktop /home/pi/Desktop
sudo rm /home/pi/RXF_DMR2YSF.desktop

frecuencia=$(awk "NR==17" /home/pi/INFO_RXF)
cd /home/pi/Desktop/
sudo cp RXF_NXDN.desktop /home/pi/
sed -i "11c Name=$frecuencia" /home/pi/RXF_NXDN.desktop
cd /home/pi
sudo cp RXF_NXDN.desktop /home/pi/Desktop
sudo rm /home/pi/RXF_NXDN.desktop

clear
echo "${AMARILLO}"
echo "     **********************************"
echo "     *                                *"
echo "     * <<<<< IMAGEN ACTUALIZADA >>>>> *"
echo "     *                                *"
echo "     **********************************"
echo "     **********************************"
echo "     **********************************"
echo "     **********************************"
                        sleep 2