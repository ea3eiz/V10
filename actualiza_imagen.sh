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
                        sudo git pull
                        sleep 1

#Importa directorio AUTOARRANQUE
                        sudo rm -R  /home/pi/$AUTOARRANQUE
                        cd /home/pi/
                        clear
                        sleep 1
#Actualiza todos los iconos
                        cd /home/pi/$SCRIPTS_version/Desktop
                        sudo cp * /home/pi/Desktop
                        echo "${AMARILLO}"


#Lee el fichero INFO_NXDN para poner lod datos en los iconos INFO TXF                        
frecuencia=$(awk "NR==1" /home/pi/INFO_RXF)
sed -i "11c Name=$frecuencia" /home/pi/Desktop/RXF_BM.desktop

frecuencia=$(awk "NR==10" /home/pi/INFO_RXF)
sed -i "11c Name=$frecuencia" /home/pi/Desktop/RXF_NXDN.desktop






echo "     *********************************"
echo "      <<<<< IMAGEN ACTUALIZADA >>>>>  "
echo "     *********************************"
                        sleep 2