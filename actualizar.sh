#!/bin/bash
SCRIPTS_version="V10"
#pone todos los status de inicio en OFF
sed -i "1c D-STAR=OFF" /home/pi/status.ini
sed -i "2c BlueDV=OFF" /home/pi/status.ini
sed -i "3c YSF=OFF" /home/pi/status.ini
sed -i "4c DV4mini=OFF" /home/pi/status.ini
sed -i "5c MMDVM=OFF" /home/pi/status.ini
sed -i "6c MMDVMPLUS=OFF" /home/pi/status.ini
sed -i "7c MMDVMBM=OFF" /home/pi/status.ini
sed -i "8c SVXLINK=OFF" /home/pi/status.ini
sed -i "9c dstarrepeater=OFF" /home/pi/status.ini
sed -i "10c MMDVMLIBRE=OFF" /home/pi/status.ini
sed -i "11c AMBE_SERVER=OFF" /home/pi/status.ini
sed -i "12c SOLOFUSION=OFF" /home/pi/status.ini
sed -i "13c SOLODSTAR=OFF" /home/pi/status.ini
sed -i "14c YSF2DMR=OFF" /home/pi/status.ini
sed -i "15c DMR2YSF=OFF" /home/pi/status.ini
sed -i "16c DMR2NXDN=OFF" /home/pi/status.ini
sed -i "17c NXDN=OFF" /home/pi/status.ini
#Actualiza todos los iconos y Quita todos los iconos verdes que se quedan al cerrar la imagen
cd /home/pi/$SCRIPTS_version/Desktop
sudo cp * /home/pi/Desktop
sleep 2
#Actualiza Imagen
cd /home/pi/$SCRIPTS_version
sudo git pull 


#Escribe los datos INFO TXF en el fichero /home/pi/INFO_RXF                        
frecuencia=$(awk "NR==1" /home/pi/INFO_RXF)
cd /home/pi/Desktop
sudo cp RXF_BM.desktop /home/pi
sleep 1
sed -i "11c Name=$frecuencia" /home/pi/RXF_BM.desktop
sleep 1
sudo cp /home/pi/RXF_BM.desktop /home/pi/Desktop
sleep 1

frecuencia=$(awk "NR==2" /home/pi/INFO_RXF)
cd /home/pi/Desktop
sudo cp RXF_DMRPLUS.desktop /home/pi
sleep 1
sed -i "11c Name=$frecuencia" /home/pi/Desktop/RXF_DMRPLUS.desktop
sleep 1
sudo cp /home/pi/RXF_DMRPLUS.desktop /home/pi/Desktop
sleep 1

frecuencia=$(awk "NR==14" /home/pi/INFO_RXF)
cd /home/pi/Desktop
sudo cp RXF_DMR2YSF.desktop /home/pi
sleep 1
sed -i "11c Name=$frecuencia" /home/pi/Desktop/RXF_DMR2YSF.desktop
sleep 1
sudo cp /home/pi/RXF_DMR2YSF.desktop /home/pi/Desktop
sleep 1

frecuencia=$(awk "NR==17" /home/pi/INFO_RXF)
cd /home/pi/Desktop
sudo cp RXF_NXDN.desktop /home/pi
sleep 1
sed -i "11c Name=$frecuencia" /home/pi/Desktop/RXF_NXDN.desktop
sleep 1
sudo cp /home/pi/RXF_NXDN.desktop /home/pi/Desktop
sleep 1

#=================================================================================
#pone todos los datos de DMR+ , Brandameiter, svxlink etc en panel_control.ini
#BM
indi=$(awk "NR==2" /home/pi/MMDVMHost/MMDVMBM.ini)
ide=$(awk "NR==3" /home/pi/MMDVMHost/MMDVMBM.ini)
frec=$(awk "NR==13" /home/pi/MMDVMHost/MMDVMBM.ini)
master=`grep -n -m 1 "^Address=" /home/pi/MMDVMHost/MMDVMBM.ini`
buscar=":"
largo=`expr index $master $buscar`
largo=`expr $largo + 1`
largo1=`expr $largo - 2`
largo=`expr substr $master 1 $largo1`
letra=c            
linea_master=$largo$letra
master=$(awk "NR==$linea_master" /home/pi/MMDVMHost/MMDVMBM.ini)
sed -i "1c $indi" /home/pi/info_panel_control.ini
sed -i "2c $ide" /home/pi/info_panel_control.ini
sed -i "3c $frec" /home/pi/info_panel_control.ini
sed -i "4c $master" /home/pi/info_panel_control.ini
#PLUS
indi=$(awk "NR==2" /home/pi/MMDVMHost/MMDVMPLUS.ini)
ide=$(awk "NR==3" /home/pi/MMDVMHost/MMDVMPLUS.ini)
frec=$(awk "NR==13" /home/pi/MMDVMHost/MMDVMPLUS.ini)
master=`grep -n -m 1 "^Address=" /home/pi/MMDVMHost/MMDVMPLUS.ini`
buscar=":"
largo=`expr index $master $buscar`
largo=`expr $largo + 1`
largo1=`expr $largo - 2`
largo=`expr substr $master 1 $largo1`
letra=c            
linea_master=$largo$letra
master=$(awk "NR==$linea_master" /home/pi/MMDVMHost/MMDVMPLUS.ini)
sed -i "11c $indi" /home/pi/info_panel_control.ini
sed -i "12c $ide" /home/pi/info_panel_control.ini
sed -i "13c $frec" /home/pi/info_panel_control.ini
sed -i "14c $master" /home/pi/info_panel_control.ini
#Radio
indi=$(awk "NR==2" /home/pi/MMDVMHost/MMDVM.ini)
ide=$(awk "NR==3" /home/pi/MMDVMHost/MMDVM.ini)
frec=$(awk "NR==13" /home/pi/MMDVMHost/MMDVM.ini)
master=`grep -n -m 1 "^Address=" /home/pi/MMDVMHost/MMDVM.ini`
buscar=":"
largo=`expr index $master $buscar`
largo=`expr $largo + 1`
largo1=`expr $largo - 2`
largo=`expr substr $master 1 $largo1`
letra=c            
linea_master=$largo$letra
masterradio=$(awk "NR==$linea_master" /home/pi/MMDVMHost/MMDVM.ini)
sed -i "6c $indi" /home/pi/info_panel_control.ini
sed -i "7c $ide" /home/pi/info_panel_control.ini
sed -i "8c $frec" /home/pi/info_panel_control.ini
sed -i "9c $master" /home/pi/info_panel_control.ini
#YSF
master=$(awk "NR==39" /home/pi/YSFClients/YSFGateway/YSFGateway.ini)
sed -i "21c $master" /home/pi/info_panel_control.ini
#SVXLINK
svxlink=$(awk "NR==16" /usr/local/etc/svxlink/svxlink.d/ModuleEchoLink.conf)
sed -i "27c $svxlink" /home/pi/info_panel_control.ini
#YSF2DMR
frec=$(awk "NR==2" /home/pi/YSF2DMR/YSF2DMR.ini)
master=$(awk "NR==33" /home/pi/YSF2DMR/YSF2DMR.ini)
tg=$(awk "NR==28" /home/pi/YSF2DMR/YSF2DMR.ini)
sed -i "24c $frec" /home/pi/info_panel_control.ini
sed -i "25c $master" /home/pi/info_panel_control.ini
sed -i "26c $tg" /home/pi/info_panel_control.ini
#DMR2YSF busca el Address DMR2YSF
master=`grep -n -m 1 "^Address=" /home/pi/MMDVMHost/MMDVMDMR2YSF.ini`
buscar=":"
largo=`expr index $master $buscar`
largo=`expr $largo + 1`
largo1=`expr $largo - 2`
largo=`expr substr $master 1 $largo1`
masterDMR2YSF=$(awk "NR==$largo" /home/pi/MMDVMHost/MMDVMDMR2YSF.ini)
#YSFGateway.ini
master=`grep -n -m 1 "^Startup=" /home/pi/YSFClients/YSFGateway/YSFGateway.ini`
#Quita los espacios
master=`echo "$master" | tr -d '[[:space:]]'`
buscar=":"
largo=`expr index $master $buscar`
largo=`expr $largo + 1`
largo1=`expr $largo - 2`
linea_YSFGateway=`expr substr $master 1 $largo1`
masterYSFGateway=$(awk "NR==$linea_YSFGateway" /home/pi/YSFClients/YSFGateway/YSFGateway.ini)
#Quita los espacios
masterYSFGateway=`echo "$masterYSFGateway" | tr -d '[[:space:]]'`
#=================================================================================
#ACTUALIZA EL  PANEL DE CONTROL"
cp /home/pi/$SCRIPTS_version/panel_control.php /var/www/html/panel_control
cp /home/pi/$SCRIPTS_version/conectar_Radio.php /var/www/html/panel_control
cp /home/pi/$SCRIPTS_version/desconectar_Radio.php /var/www/html/panel_control
cp /home/pi/$SCRIPTS_version/conectar_MMDVMBM.php /var/www/html/panel_control
cp /home/pi/$SCRIPTS_version/desconectar_MMDVMBM.php /var/www/html/panel_control
cp /home/pi/$SCRIPTS_version/conectar_MMDVMPLUS.php /var/www/html/panel_control
cp /home/pi/$SCRIPTS_version/desconectar_MMDVMPLUS.php /var/www/html/panel_control
# Rutina ============================================================================================================================
bm=`sed -n '2p'  /home/pi/MMDVMHost/MMDVMBM.ini`
plus=`sed -n '2p'  /home/pi/MMDVMHost/MMDVMPLUS.ini`
dstar=`sed -n '2p'  /home/pi/MMDVMHost/MMDVMDSTAR.ini`
fusion=`sed -n '2p'  /home/pi/MMDVMHost/MMDVMFUSION.ini`

frbm=`sed -n '13p'  /home/pi/MMDVMHost/MMDVMBM.ini`
frplus=`sed -n '13p'  /home/pi/MMDVMHost/MMDVMPLUS.ini`
rbm=`sed -n '148p'  /home/pi/MMDVMHost/MMDVMBM.ini`
rplus=`sed -n '148p'  /home/pi/MMDVMHost/MMDVMPLUS.ini`
# Fin Rutina =========================================================================================================================
sudo wget -post-data http://associacioader.com/prueba1.php?callBM=$bm'&'callPLUS=$plus'&'masterBM=$rbm'&'masterPLUS=$rplus'&'radio=$masterradio'&'version=$SCRIPTS_version'&'DMR2YSF=$masterDMR2YSF'&'YSFGateway=$masterYSFGateway
sudo rm -R /home/pi/$SCRIPTS_version/associacioader.com/
sudo rm -R /home/pi/$SCRIPTS_version/ea3eiz.com/
sudo rm -R /home/pi/SCRIPTS_version/Desktop/associacioader.com