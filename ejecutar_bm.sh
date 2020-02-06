#!/bin/bash

#modo=$(awk "NR==18" /home/pi/status.ini)
#if [ "$modo" = 'DVSWITCH=ON' ];then
#echo "\033[1;31m" #ROJO
#echo "******************************************"
#echo "      NO SE PUEDE ABRIR ESTE SISTEMA     *"
#echo "       SI ESTA EL DVSWITCH ACTIVADO      *"
#echo "******************************************"
#sleep 5
#else
echo "***********************************************"
echo "*            ABRIENDO BRANDMEISTER            * "
echo "***********************************************"
mode=`grep -n -m 1 "^Port=" /home/pi/MMDVMHost/MMDVMBM.ini`
buscar=":"
caracteres=`expr index $mode $buscar`
caracteres_linea=`expr $caracteres - 1`
numero_linea_port=`expr substr $mode 1 $caracteres_linea`
mode=$(awk "NR==$numero_linea_port" /home/pi/MMDVMHost/MMDVMBM.ini)
puerto=`expr substr $mode 14 9`
puerto="  "$puerto
cd /home/pi/Desktop
sudo cp RXF_BM.desktop /home/pi
sleep 1
frecuencia=$(awk "NR==13" /home/pi/MMDVMHost/MMDVMBM.ini)
frecuencia=`expr substr $frecuencia 13 17`
frecuencia=$frecuencia$puerto
sed -i "11c Name=$frecuencia" /home/pi/RXF_BM.desktop
sleep 1
sudo cp /home/pi/RXF_BM.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/RXF_BM.desktop

#Escribe en el fichero INFO_RXF para poner los datos en el icono INFO TXF                        
sed -i "1c $frecuencia" /home/pi/INFO_RXF

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_MMDVMBM.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; lxterminal --geometry=72x15 -e sudo sh cerrar_bm.sh'" /home/pi/Abrir_MMDVMBM.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_BM_ON.png" /home/pi/Abrir_MMDVMBM.desktop
sed -i "10c Name[es_ES]=Cerrar BM" /home/pi/Abrir_MMDVMBM.desktop
sed -i "7c MMDVMBM=ON" /home/pi/status.ini
cd /home/pi
sudo cp Abrir_MMDVMBM.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_MMDVMBM.desktop

cd /home/pi/MMDVMHost
echo "\33[38;5;138m"
clear
echo "***********************************************"
echo "*            ABRIENDO BRANDMEISTER            * "
echo "***********************************************"
sleep 1
sudo ./MMDVMBM MMDVMBM.ini

fi
