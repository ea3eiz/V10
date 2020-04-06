#!/bin/bash
usuario=$(awk "NR==1" /home/pi/.config/autostart/usuario)
#sed -i "4c #Exec=sh -c 'cd /home/pi/NextionDriver/;sudo ./NextionDriver -c /home/pi/MMDVMHost/MMDVM.ini'" $usuario/.config/autostart/nextiondriver.desktop
#sudo sed -i "57c dtoverlay=pi3-disable-bt" /boot/config.txt
# path usuario

SCRIPTS_version=$(awk "NR==1" $usuario/.config/autostart/version)
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
echo "   *****************************************************"
echo "   *           ACTUALIZANDO POSIBLES CAMBIOS           *"
echo "   *              EN LA IMAGEN V.02.07.$version              *"
echo "   *****************************************************"
sleep 2

						# 01-04-2019 arregla no escribe port en FCS.ini
						sudo cp /home/pi/V104/cambia_configuracion_port.php /var/www/html/

                        # 03-04-2019 añade el options manual para DMR+
                        sudo cp /home/pi/V104/sistema_plus.php /var/www/html/
                        sudo cp /home/pi/V104/cambia_reflector_dmrplus.php /var/www/html/
                        sudo cp /home/pi/V104/cambia_options_dmrplus.php /var/www/html/
                        sudo cp /home/pi/V104/panel_configuracion.php /var/www/html/
                        
#Actualiza reflectores
                        cd /usr/local/share/opendv/
                        sudo curl --fail -o DExtra_Hosts.txt -s http://www.pistar.uk/downloads/DExtra_Hosts.txt
                        sudo curl --fail -o DCS_Hosts.txt -s http://www.pistar.uk/downloads/DCS_Hosts.txt
                        sudo curl --fail -o DPlus_Hosts.txt -s http://www.pistar.uk/downloads/DPlus_Hosts.txt
                        sudo cp DExtra_Hosts.txt $usuario/dv4mini/xref.ip
#Actualiza IMAGEN
                        cd $usuario/$SCRIPTS_version
                        git pull
                        sleep 3

#Lee el fichero INFO_RXF para poner los datos en los iconos INFO TXF                        
frecuencia=$(awk "NR==1" $usuario/INFO_RXF)
cd $usuario/Desktop/
sudo cp RXF_BM.desktop $usuario/
sed -i "11c Name=$frecuencia" $usuario/RXF_BM.desktop
cd $usuario
sudo cp RXF_BM.desktop $usuario/Desktop
sudo rm $usuario/RXF_BM.desktop

frecuencia=$(awk "NR==2" $usuario/INFO_RXF)
cd $usuario/Desktop/
sudo cp RXF_DMRPLUS.desktop $usuario/
sed -i "11c Name=$frecuencia" $usuario/RXF_DMRPLUS.desktop
cd $usuario
sudo cp RXF_DMRPLUS.desktop $usuario/Desktop
sudo rm $usuario/RXF_DMRPLUS.desktop

frecuencia=$(awk "NR==14" $usuario/INFO_RXF)
cd $usuario/Desktop/
sudo cp RXF_DMR2YSF.desktop $usuario/
sed -i "11c Name=$frecuencia" $usuario/RXF_DMR2YSF.desktop
cd $usuario
sudo cp RXF_DMR2YSF.desktop $usuario/Desktop
sudo rm $usuario/RXF_DMR2YSF.desktop

frecuencia=$(awk "NR==17" $usuario/INFO_RXF)
cd $usuario/Desktop/
sudo cp RXF_NXDN.desktop $usuario/
sed -i "11c Name=$frecuencia" $usuario/RXF_NXDN.desktop
cd $usuario
sudo cp RXF_NXDN.desktop $usuario/Desktop
sudo rm $usuario/RXF_NXDN.desktop

clear
echo "${AMARILLO}"
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo "   *****************************************************"
echo "   *                                                   *"
echo "   *          <<<<< IMAGEN ACTUALIZADA >>>>>           *"
echo "   *                                                   *"
echo "   *****************************************************"
sleep 3