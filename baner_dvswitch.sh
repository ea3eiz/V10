#!/bin/bash
actualizacion=$(awk "NR==1" /home/pi/.config/autostart/actualizacion)
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
NUMERO_VERSION=`expr substr $SCRIPTS_version 2 2`
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
echo "${VERDE}"
echo "   ************************************************************************************"
echo -n "${AMARILLO}"
echo "                      IMPORTANTE!!  LEE ESTA NOTA"
echo -n "${VERDE}"                                                                                 
echo "   ************************************************************************************"
echo ""
echo "Para configurar el Dvswitch debes de abrir un navegador y poner la ip de la raspberry  "
echo ""
echo "Verás dos ventanas, haz click en la que pone DVSWITCH MOBILE y te llevará a la página"
echo ""
echo "de configuracion General y todo lo relaccionado con el DVSWITCH"
echo ""
echo "   ************************************************************************************"
echo ""
echo "   ************************************************************************************"

echo ""
echo -n "\33[1;36m   Pulsa la tecla ENTER para salir "
read A
exit;

						


