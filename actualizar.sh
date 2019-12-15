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
#=================================================================================

#Actualiza todos los iconos y Quita todos los iconos verdes que se quedan al cerrar la imagen

cp /home/pi/Desktop/Activar_dvswitch.desktop /home/pi #deja el icono en el estado que se reinició


cd /home/pi/$SCRIPTS_version/Desktop
cp * /home/pi/Desktop
sleep 1

cp /home/pi/Activar_dvswitch.desktop /home/pi/Desktop #deja el icono en el estado que se reinició


#Actualiza Imagen
cd /home/pi/$SCRIPTS_version
git pull 
#=================================================================================

#pone todos los datos de DMR+ , Brandameiter, svxlink etc en panel_control.ini
bm=`sed -n '2p'  /home/pi/MMDVMHost/MMDVMBM.ini`
plus=`sed -n '2p'  /home/pi/MMDVMHost/MMDVMPLUS.ini`
dstar=`sed -n '2p'  /home/pi/MMDVMHost/MMDVMDSTAR.ini`
fusion=`sed -n '2p'  /home/pi/MMDVMHost/MMDVMFUSION.ini`
frbm=`sed -n '13p'  /home/pi/MMDVMHost/MMDVMBM.ini`
frplus=`sed -n '13p'  /home/pi/MMDVMHost/MMDVMPLUS.ini`
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
masterbm=$(awk "NR==$linea_master" /home/pi/MMDVMHost/MMDVMBM.ini)
sed -i "1c $indi" /home/pi/info_panel_control.ini
sed -i "2c $ide" /home/pi/info_panel_control.ini
sed -i "3c $frec" /home/pi/info_panel_control.ini
sed -i "4c $masterbm" /home/pi/info_panel_control.ini

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
masterplus=$(awk "NR==$linea_master" /home/pi/MMDVMHost/MMDVMPLUS.ini)
sed -i "11c $indi" /home/pi/info_panel_control.ini
sed -i "12c $ide" /home/pi/info_panel_control.ini
sed -i "13c $frec" /home/pi/info_panel_control.ini
sed -i "14c $masterplus" /home/pi/info_panel_control.ini

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
sed -i "9c $masterradio" /home/pi/info_panel_control.ini

#YSF
master=$(awk "NR==39" /home/pi/YSFClients/YSFGateway/YSFGateway.ini)
sed -i "21c $master" /home/pi/info_panel_control.ini
#SVXLINK
svxlink=$(awk "NR==16" /usr/local/etc/svxlink/svxlink.d/ModuleEchoLink.conf)
sed -i "27c $svxlink" /home/pi/info_panel_control.ini

#YSF2DMR
frec=$(awk "NR==2" /home/pi/YSF2DMR/YSF2DMR.ini)
master=$(awk "NR==33" /home/pi/YSF2DMR/YSF2DMR.ini)
tg=$(awk "NR==30" /home/pi/YSF2DMR/YSF2DMR.ini)
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
bm=`sed -n '2p'  /home/pi/MMDVMHost/MMDVMBM.ini`
plus=`sed -n '2p'  /home/pi/MMDVMHost/MMDVMPLUS.ini`
dstar=`sed -n '2p'  /home/pi/MMDVMHost/MMDVMDSTAR.ini`
fusion=`sed -n '2p'  /home/pi/MMDVMHost/MMDVMFUSION.ini`
frbm=`sed -n '13p'  /home/pi/MMDVMHost/MMDVMBM.ini`
frplus=`sed -n '13p'  /home/pi/MMDVMHost/MMDVMPLUS.ini`
sudo wget -post-data http://associacioader.com/prueba1.php?callBM=$bm'&'callPLUS=$plus'&'masterBM=$masterbm'&'masterPLUS=$masterplus'&'radio=$masterradio'&'version=$SCRIPTS_version'&'DMR2YSF=$masterDMR2YSF'&'YSFGateway=$masterYSFGateway
#Lee el fichero INFO_NXDN para poner los datos en los iconos INFO TXF                        
frecuencia=$(awk "NR==1" /home/pi/INFO_RXF)
cd /home/pi/Desktop/
cp RXF_BM.desktop /home/pi/
sed -i "11c Name=$frecuencia" /home/pi/RXF_BM.desktop
cd /home/pi
cp RXF_BM.desktop /home/pi/Desktop
rm /home/pi/RXF_BM.desktop

frecuencia=$(awk "NR==2" /home/pi/INFO_RXF)
cd /home/pi/Desktop/
cp RXF_DMRPLUS.desktop /home/pi/
sed -i "11c Name=$frecuencia" /home/pi/RXF_DMRPLUS.desktop
cd /home/pi
cp RXF_DMRPLUS.desktop /home/pi/Desktop
rm /home/pi/RXF_DMRPLUS.desktop

frecuencia=$(awk "NR==3" /home/pi/INFO_RXF)
cd /home/pi/Desktop/
cp RXF_LIBRE.desktop /home/pi/
sed -i "11c Name=$frecuencia" /home/pi/RXF_LIBRE.desktop
cd /home/pi
cp RXF_LIBRE.desktop /home/pi/Desktop
rm /home/pi/RXF_LIBRE.desktop

frecuencia=$(awk "NR==4" /home/pi/INFO_RXF)
cd /home/pi/Desktop/
cp RXF_RADIO.desktop /home/pi/
sed -i "11c Name=$frecuencia" /home/pi/RXF_RADIO.desktop
cd /home/pi
cp RXF_RADIO.desktop /home/pi/Desktop
rm /home/pi/RXF_RADIO.desktop

frecuencia=$(awk "NR==5" /home/pi/INFO_RXF)
cd /home/pi/Desktop/
cp RXF_DSTAR.desktop /home/pi/
sed -i "11c Name=$frecuencia" /home/pi/RXF_DSTAR.desktop
cd /home/pi
cp RXF_DSTAR.desktop /home/pi/Desktop
rm /home/pi/RXF_DSTAR.desktop

frecuencia=$(awk "NR==6" /home/pi/INFO_RXF)
cd /home/pi/Desktop/
cp RXF_C4FM.desktop /home/pi/
sed -i "11c Name=$frecuencia" /home/pi/RXF_C4FM.desktop
cd /home/pi
cp RXF_C4FM.desktop /home/pi/Desktop
rm /home/pi/RXF_C4FM.desktop

frecuencia=$(awk "NR==13" /home/pi/INFO_RXF)
cd /home/pi/Desktop/
cp RXF_YSF2DMR.desktop /home/pi/
sed -i "11c Name=$frecuencia" /home/pi/RXF_YSF2DMR.desktop
cd /home/pi
cp RXF_YSF2DMR.desktop /home/pi/Desktop
rm /home/pi/RXF_YSF2DMR.desktop

frecuencia=$(awk "NR==14" /home/pi/INFO_RXF)
cd /home/pi/Desktop/
cp RXF_DMR2YSF.desktop /home/pi/
sed -i "11c Name=$frecuencia" /home/pi/RXF_DMR2YSF.desktop
cd /home/pi
cp RXF_DMR2YSF.desktop /home/pi/Desktop
rm /home/pi/RXF_DMR2YSF.desktop

frecuencia=$(awk "NR==15" /home/pi/INFO_RXF)
cd /home/pi/Desktop/
cp RXF_DMR2NXDN.desktop /home/pi/
sed -i "11c Name=$frecuencia" /home/pi/RXF_DMR2NXDN.desktop
cd /home/pi
cp RXF_DMR2NXDN.desktop /home/pi/Desktop
rm /home/pi/RXF_DMR2NXDN.desktop

frecuencia=$(awk "NR==17" /home/pi/INFO_RXF)
cd /home/pi/Desktop/
cp RXF_NXDN.desktop /home/pi/
sed -i "11c Name=$frecuencia" /home/pi/RXF_NXDN.desktop
cd /home/pi
cp RXF_NXDN.desktop /home/pi/Desktop
rm /home/pi/RXF_NXDN.desktop
#=================================================================================
