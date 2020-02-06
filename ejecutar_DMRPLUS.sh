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
echo "*               ABRIENDO DMR+                 * "
echo "***********************************************"
mode=`grep -n -m 1 "^Port=" /home/pi/MMDVMHost/MMDVMPLUS.ini`
buscar=":"
caracteres=`expr index $mode $buscar`
caracteres_linea=`expr $caracteres - 1`
numero_linea_port=`expr substr $mode 1 $caracteres_linea`
mode=$(awk "NR==$numero_linea_port" /home/pi/MMDVMHost/MMDVMPLUS.ini)
puerto=`expr substr $mode 14 9`
puerto="  "$puerto
cd /home/pi/Desktop
sudo cp RXF_DMRPLUS.desktop /home/pi
frecuencia=$(awk "NR==13" /home/pi/MMDVMHost/MMDVMPLUS.ini)
frecuencia=`expr substr $frecuencia 13 9`
frecuencia=$frecuencia$puerto
sed -i "11c Name=$frecuencia" /home/pi/RXF_DMRPLUS.desktop
sleep 1
sudo cp /home/pi/RXF_DMRPLUS.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/RXF_DMRPLUS.desktop

#Escribe en el fichero INFO_NXDN para poner los datos en los iconos INFO TXF 
sed -i "2c $frecuencia" /home/pi/INFO_RXF

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_MMDVMPLUS.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;lxterminal --geometry=72x15 -e sudo sh cerrar_DMRPLUS.sh'" /home/pi/Abrir_MMDVMPLUS.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_DMRPLUS_ON.png" /home/pi/Abrir_MMDVMPLUS.desktop
sed -i "10c Name[es_ES]=Cerrar DMR+" /home/pi/Abrir_MMDVMPLUS.desktop
sed -i "6c MMDVMPLUS=ON" /home/pi/status.ini
cd /home/pi
sudo cp Abrir_MMDVMPLUS.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_MMDVMPLUS.desktop

cd /home/pi/MMDVMHost
echo "\33[1;37m"
clear
echo "***********************************************"
echo "*               ABRIENDO DMR+                 * "
echo "***********************************************"
sleep 1
sudo ./MMDVMPLUS MMDVMPLUS.ini

#cd /home/pi/Desktop
#sudo cp Abrir_MMDVMPLUS.desktop /home/pi
#sed -i "4cExec=sh -c 'cd /home/pi/$SCRIPTS_version;lxterminal --geometry=72x15 -e sudo sh ejecutar_plus_30.sh'" /home/pi/Abrir_MMDVMPLUS.desktop
#sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_DMRPLUS.png" /home/pi/Abrir_MMDVMPLUS.desktop
#sed -i "10c Name[es_ES]=Abrir DMR+" /home/pi/Abrir_MMDVMPLUS.desktop
#sed -i "6c MMDVMPLUS=OFF" /home/pi/status.inicd /home/pi
#sudo cp Abrir_MMDVMPLUS.desktop /home/pi/Desktop
#sleep 1
#sudo rm /home/pi/Abrir_MMDVMPLUS.desktop
fi