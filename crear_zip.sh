#!/bin/bash

            cd /home/pi/MMDVMHost
            sudo cp -f TODOS_LOS_INIS.ini /home/pi/Downloads
            sudo cp -f MMDVM.ini /home/pi/Downloads
            sudo cp -f MMDVM.ini_copia /home/pi/Downloads
            sudo cp -f MMDVM.ini_copia2 /home/pi/Downloads
            sudo cp -f MMDVM.ini_copia3 /home/pi/Downloads
            sudo cp -f MMDVM.ini_original /home/pi/Downloads
            sudo cp -f MMDVMBM.ini /home/pi/Downloads
            sudo cp -f MMDVMBM.ini_copia /home/pi/Downloads
            sudo cp -f MMDVMBM.ini_copia2 /home/pi/Downloads
            sudo cp -f MMDVMBM.ini_copia3 /home/pi/Downloads
            sudo cp -f MMDVMLIBRE.ini /home/pi/Downloads
            sudo cp -f MMDVMLIBRE.ini_uno /home/pi/Downloads
            sudo cp -f MMDVMLIBRE.ini_dos /home/pi/Downloads      
            sudo cp -f MMDVMPLUS.ini /home/pi/Downloads
            sudo cp -f MMDVMPLUS.ini_copia /home/pi/Downloads
            sudo cp -f MMDVMPLUS.ini_copia2 /home/pi/Downloads
            sudo cp -f MMDVMPLUS.ini_copia3 /home/pi/Downloads

            sudo cp -f MMDVMDMR2NXDN.ini /home/pi/Downloads
            sudo cp -f MMDVMDMR2YSF.ini /home/pi/Downloads

            sudo cp -f MMDVMNXDN.ini /home/pi/Downloads

            cp -f /home/pi/DMR2NXDN/DMR2NXDN.ini  /home/pi/Downloads
            cp -f /home/pi/NXDNClients/NXDNGateway/NXDNGateway.ini  /home/pi/Downloads
            cp -f /home/pi/DMR2YSF/DMR2YSF.ini  /home/pi/Downloads

            #solo Dstar
            cp -f MMDVMDSTAR.ini /home/pi/Downloads
            cp -f MMDVMDSTAR.ini_copia /home/pi/Downloads
            cp -f MMDVMDSTAR.ini_copia2 /home/pi/Downloads
            cp -f MMDVMDSTAR.ini_copia3 /home/pi/Downloads

            #solo Fusion
            cp -f MMDVMFUSION.ini /home/pi/Downloads
            cp -f MMDVMFUSION.ini_copia /home/pi/Downloads
            cp -f MMDVMFUSION.ini_copia2 /home/pi/Downloads
            cp -f MMDVMFUSION.ini_copia3 /home/pi/Downloads

            cd  /home/pi/YSF2DMR
            cp -f YSF2DMR.ini /home/pi/Downloads
            cp -f YSF2DMR.ini_copia_01 /home/pi/Downloads
            cp -f YSF2DMR.ini_copia_02 /home/pi/Downloads
            cp -f YSF2DMR.ini_copia_03 /home/pi/Downloads
            cp -f YSF2DMR.ini_copia_04 /home/pi/Downloads

            cd  /home/pi/DMR2YSF
            cp -f TG-YSFList.txt /home/pi/Downloads

            cd  /home/pi/YSFClients/YSFGateway/
            sudo cp -f YSFGateway.ini /home/pi/Downloads
            
            cd /home/pi/bluedv/
            sudo cp -f BlueDVconfig.ini /home/pi/Downloads

            cd /usr/local/etc/svxlink/
            sudo cp -f svxlink.conf /home/pi/Downloads

            cd /usr/local/etc/svxlink/svxlink.d/
            sudo cp -f ModuleEchoLink.conf /home/pi/Downloads

            sudo cp /usr/local/etc/opendv/ircddbgateway /home/pi/Downloads
            sudo cp /usr/local/etc/opendv/dstarrepeater /home/pi/Downloads

            cd /home/pi
            sudo cp info_panel_control.ini /home/pi/Downloads

indicativo=$(awk "NR==2" /opt/MMDVM_Bridge/MMDVM_Bridge.ini)
indicativo=`expr substr $indicativo 10 6`

address_especial=$(awk "NR==70" /opt/MMDVM_Bridge/especial.ini)

id=$(awk "NR==38" /opt/Analog_Bridge/Analog_Bridge.ini)
id=`echo "$id" | tr -d '[[:space:]]'`
id=`expr substr $id 14 7`

id2=$(awk "NR==3" /opt/MMDVM_Bridge/MMDVM_Bridge.ini)
id2=`expr substr $id2 4 9`

Latitude=$(awk "NR==11" /opt/MMDVM_Bridge/MMDVM_Bridge.ini)
Latitude=`expr substr $Latitude 10 10`

Longitude=$(awk "NR==12" /opt/MMDVM_Bridge/MMDVM_Bridge.ini)
Longitude=`expr substr $Longitude 11 10`

port=$(awk "NR==56" /opt/Analog_Bridge/Analog_Bridge.ini)
port=`echo "$port" | tr -d '[[:space:]]'`
port=`expr substr $port 8 5`

location=$(awk "NR==14" /opt/MMDVM_Bridge/MMDVM_Bridge.ini)

url=$(awk "NR==16" /opt/MMDVM_Bridge/MMDVM_Bridge.ini)
url=`expr substr $url 5 30`

password_especial=$(awk "NR==74" /opt/MMDVM_Bridge/especial.ini)

port_especial=$(awk "NR==71" /opt/MMDVM_Bridge/especial.ini)

sala_fcs=$(awk "NR==40" /opt/Analog_Bridge/FCS.ini)
sala_fcs=`echo "$sala_fcs" | tr -d '[[:space:]]'`
sala_fcs=`expr substr $sala_fcs 6 20`

sala_nxdn=$(awk "NR==10" /opt/NXDNClients/NXDNGateway/private/NXDNHosts.txt)

selfcare=$(awk "NR==74" /opt/MMDVM_Bridge/brandmeister_esp.ini)

reflector_dstar=$(awk "NR==18" /etc/ircddbgateway)

sudo sed -i "1c $indicativo" /home/pi/Downloads/datos_dvswitch
sudo sed -i "2c $address_especial" /home/pi/Downloads/datos_dvswitch
sudo sed -i "3c $id" /home/pi/Downloads/datos_dvswitch
sudo sed -i "4c $id2" /home/pi/Downloads/datos_dvswitch
sudo sed -i "5c $Latitude" /home/pi/Downloads/datos_dvswitch
sudo sed -i "6c $Longitude" /home/pi/Downloads/datos_dvswitch
sudo sed -i "7c $port" /home/pi/Downloads/datos_dvswitch
sudo sed -i "8c $location" /home/pi/Downloads/datos_dvswitch
sudo sed -i "9c $url" /home/pi/Downloads/datos_dvswitch
sudo sed -i "10c $password_especial" /home/pi/Downloads/datos_dvswitch
sudo sed -i "11c $port_especial" /home/pi/Downloads/datos_dvswitch
sudo sed -i "12c $sala_fcs" /home/pi/Downloads/datos_dvswitch
sudo sed -i "13c $sala_nxdn" /home/pi/Downloads/datos_dvswitch
sudo sed -i "14c $selfcare" /home/pi/Downloads/datos_dvswitch
sudo sed -i "15c $reflector_dstar" /home/pi/Downloads/datos_dvswitch

cd /home/pi/
tar -zcvf copia.tar.gz Downloads
cp  copia.tar.gz /var/www/html/upload/files
sudo rm copia.tar.gz

sudo sed -i "19c COPIAS=ON" /home/pi/status.ini


