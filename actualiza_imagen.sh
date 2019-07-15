#!/bin/bash

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
AUTOARRANQUE="AUTOARRANQUE"
AUTOARRANQUE=$AUTOARRANQUE$SCRIPTS_version

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
