#!/bin/bash


clear
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
echo "${VERDE}"
echo "   *************************************************************************"
echo "   *                                                                       *"
echo "   *              El BlueDV puede tardar 1 minuto en abrir                 *"
echo "   *           dependiendo de la velocidad de su raspberry pi              *"
echo "   *             Por favor sea paciente y espere que se abra               *"
echo "   *                                                                       *"
echo "   *************************************************************************"
echo "${BLANCO}"
echo "   *************************************************************************"
echo "   *                                                                       *"
echo "   *       Esta ventana se cerrará sola cuando arranque el BlueDV          *"
echo "   *                                                                       *"
echo "   * ${ROJO}                  IMPORTANTE!!! NO LA CIERRE ANTES                    ${BLANCO}*"
echo "   * ${BLANCO}                                                                      *"
echo "   *************************************************************************"
echo ""







SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_BlueDV.desktop /home/pi
sleep 1
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh cerrar_bluedv.sh'" /home/pi/Abrir_BlueDV.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_BLUEDV_ON.png" /home/pi/Abrir_BlueDV.desktop
sed -i "10c Name[es_ES]=Cerrar BlueDV" /home/pi/Abrir_BlueDV.desktop
sed -i "2c BlueDV=ON" /home/pi/status.ini
cd /home/pi
sudo cp Abrir_BlueDV.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_BlueDV.desktop

cd /home/pi/bluedv/
mono BlueDV.exe