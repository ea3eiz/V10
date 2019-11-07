#!/bin/bash

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)

cd /home/pi/$SCRIPTS_version
sudo sh cerrar_ambe_server.sh
sudo sh cerrar_bluedv.sh
sudo sh cerrar_bm.sh
sudo sh cerrar_d-star.sh
sudo sh cerrar_DMR2NXDN.sh
sudo sh cerrar_DMR2YSF.sh
sudo sh cerrar_DMRPLUS.sh
sudo sh cerrar_dstarrepeater_30.sh
sudo sh cerrar_dv4mini.sh
sudo sh cerrar_dvrptr.sh
sudo sh cerrar_LIBRE.sh
sudo sh cerrar_NXDN.sh
sudo sh cerrar_radio.sh
sudo sh cerrar_solodstar.sh
sudo sh cerrar_solofusion.sh
sudo sh cerrar_ysf.sh
sudo sh cerrar_YSF2DMR.sh

sleep 2

cd /home/pi/Desktop
sudo cp Activar_dvswitch.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh stop_dvswitch.sh'" /home/pi/Activar_dvswitch.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_DVSWITCH_ON.png" /home/pi/Activar_dvswitch.desktop
sed -i "10c Name[es_ES]=Parar Dvswitch" /home/pi/Activar_dvswitch.desktop

cd /home/pi
sudo cp Activar_dvswitch.desktop /home/pi/Desktop
sleep 2
sudo rm /home/pi/Activar_dvswitch.desktop

sudo systemctl restart ysfgateway.service
sudo systemctl restart dmr2ysf.service

sudo systemctl restart analog_bridge.service
sudo systemctl restart ircddbgateway.service
sudo systemctl restart md380-emu.service
sudo systemctl restart mmdvm_bridge.service
sudo systemctl restart nxdngateway.service

				
						
						