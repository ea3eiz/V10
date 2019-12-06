#!/bin/bash
clear
while true
do
clear
# path usuario
usuario=$(awk "NR==1" /home/pi/.config/autostart/usuario)
# path usuario
SCRIPTS_version=$(awk "NR==1" $usuario/.config/autostart/version)

CIAN="\033[1;36m"
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
echo "${VERDE}"
echo "   ************************************************************************"
echo "   *        Script para Editor AMBE SERVER\33[1;33m       ${ROJO} by EA3EIZ          \33[1;32m     *"
echo "   ************************************************************************"
echo -n "\33[1;36m   1)\33[0m Modificar puerto ROUTER  - \33[1;33m"
var1= sed -n '1p'  $usuario/ambe_server.ini

echo -n "\33[1;36m   2)\33[0m Modificar puerto MODEM   - \33[1;33m"
var1= sed -n '2p'  $usuario/ambe_server.ini

echo -n "\33[1;36m   3)\33[0m Modificar Baut rate      - \33[1;33m"
var1= sed -n '3p'  $usuario/ambe_server.ini

echo ""
echo "   ${ROJO}0) Salir ${AMARILLO}(si usas ratón puedes salir directamente con la x del terminal)"
echo ""

echo -n "\33[1;36m   Elige una opción: " 
read escoger_menu

case $escoger_menu in
1) echo ""
while true
do
                    echo -n "Valor actual del puerto ROUTER: \33[1;33m"
                    var1= sed -n '1p'  $usuario/ambe_server.ini
                    actualizar=S
                    case $actualizar in
                    [sS]* )
           	     read -p 'Introduce el puerto que has abierto en el Router:        ' pruter
                    sed -i "1c $pruter" $usuario/ambe_server.ini
			     break;;
			     [nN]* ) echo ""
			     break;;
esac
done;;
2) echo ""
while true
do
                    echo -n "Valor actual del puerto MODEM: \33[1;33m"
                    var1= sed -n '2p'  $usuario/ambe_server.ini
                    echo "${VERDE}ejp. /dev/ttyUSB0"
                    actualizar=S
                    case $actualizar in
                    [sS]* )
                    echo "${CIAN}"
                    read -p 'Introduce puerto que has abierto en el Modem:        ' pruter
                    sed -i "2c $pruter" $usuario/ambe_server.ini
                    break;;
                    [nN]* ) echo ""
                    break;;
esac
done;;
3) echo ""
while true
do
                    echo -n "Valor actual de la velocidad: \33[1;33m"
                    var1= sed -n '3p'  $usuario/ambe_server.ini
                    echo "${VERDE}ejp. Ambe 3000= 230400  dv stick 30 = 460800"
                    actualizar=S
                    case $actualizar in
                    [sS]* )
                    echo "${CIAN}"
                    read -p 'Introduce puerto la velocidad:        ' pruter
                    sed -i "3c $pruter" $usuario/ambe_server.ini
                    break;;
                    [nN]* ) echo ""
                    break;;
esac
done;;
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

