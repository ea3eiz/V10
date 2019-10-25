#!/bin/bash
clear
while true
do
clear

#abre el editor ircDDB
sudo ircddbgatewayconfig

ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
echo "${VERDE}"
echo "   *************************************************************************"
echo "   *                                                                       *"
echo "   *       El editor ircDDb tardará entre 1/2 y 2 minuto en abrir          *"
echo "   *           dependiendo de la velocidad de tu raspberry pi              *"
echo "   *             Por favor sea paciente y espere que se abra               *"
echo "   *                                                                       *"
echo "   *************************************************************************"
echo ""
echo "   ${ROJO}0) Salir ${AMARILLO}(si usas ratón puedes salir directamente con la x del terminal)"
echo ""
read escoger_menu

case $escoger_menu in

0) echo ""
clear
echo "\33[1;33m   **************************************************"
echo "   *                                                *"
echo "   *     CERRANDO SCRIPT                            *"
echo "   *                                                *"
echo "   **************************************************"
sleep 1
clear
exit;;	
esac
done

