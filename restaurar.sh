#!/bin/bash
cd /var/www/html/upload/files
sudo chmod -R 777 /home/pi/Downloads
cp copia.tar.gz /home/pi/Downloads
cd /home/pi/Downloads
tar -xvzf copia.tar.gz
cd /home/pi/Downloads/Downloads
cp *.* /home/pi/Downloads
rm -r /home/pi/Downloads/Downloads
rm /home/pi/Downloads/copia.tar.gz
echo "\33[1;32m" #color verde
echo "***************************************************"
echo "* ESTAS RESTAURANDO UNA COPIA DE LA MISMA VERSIÓN *"
echo "*      DEL MMDVMHOST QUE TIENES ACTUALIZADO       *"
echo "***************************************************"
            sudo chmod -R 777 /home/pi/Downloads
            cd /home/pi/Downloads
            sudo cp -f TODOS_LOS_INIS.ini /home/pi/MMDVMHost
            sudo cp -f MMDVM.ini /home/pi/MMDVMHost
            sudo cp -f MMDVM.ini_copia /home/pi/MMDVMHost
            sudo cp -f MMDVM.ini_copia2 /home/pi/MMDVMHost
            sudo cp -f MMDVM.ini_copia3 /home/pi/MMDVMHost
            sudo cp -f MMDVM.ini_original /home/pi/MMDVMHost
            sudo cp -f MMDVMBM.ini /home/pi/MMDVMHost
            sudo cp -f MMDVMBM.ini_copia /home/pi/MMDVMHost
            sudo cp -f MMDVMBM.ini_copia2 /home/pi/MMDVMHost
            sudo cp -f MMDVMBM.ini_copia3 /home/pi/MMDVMHost
            sudo cp -f MMDVMLIBRE.ini /home/pi/MMDVMHost
            sudo cp -f MMDVMLIBRE.ini_uno /home/pi/MMDVMHost
            sudo cp -f MMDVMLIBRE.ini_dos /home/pi/DoMMDVMHost     
            sudo cp -f MMDVMPLUS.ini /home/pi/MMDVMHost
            sudo cp -f MMDVMPLUS.ini_copia /home/pi/MMDVMHost
            sudo cp -f MMDVMPLUS.ini_copia2 /home/pi/MMDVMHost
            sudo cp -f MMDVMPLUS.ini_copia3 /home/pi/MMDVMHost

            #solo Dstar
            sudo cp -f MMDVMDSTAR.ini /home/pi/MMDVMHost
            sudo cp -f MMDVMDSTAR.ini_copia /home/pi/MMDVMHost
            sudo cp -f MMDVMDSTAR.ini_copia2 /home/pi/MMDVMHost
            sudo cp -f MMDVMDSTAR.ini_copia3 /home/pi/MMDVMHost

            #solo Fusion
            sudo cp -f MMDVMFUSION.ini /home/pi/MMDVMHost
            sudo cp -f MMDVMFUSION.ini_copia /home/pi/MMDVMHost
            sudo cp -f MMDVMFUSION.ini_copia2 /home/pi/MMDVMHost
            sudo cp -f MMDVMFUSION.ini_copia3 /home/pi/MMDVMHost

            cp -f YSF2DMR.ini /home/pi/YSF2DMR
            cp -f YSF2DMR.ini_copia_01 /home/pi/YSF2DMR
            cp -f YSF2DMR.ini_copia_02 /home/pi/YSF2DMR
            cp -f YSF2DMR.ini_copia_03 /home/pi/YSF2DMR
            cp -f YSF2DMR.ini_copia_04 /home/pi/YSF2DMR
            
            cp -f TG-YSFList.txt /home/pi/DMR2YSF
                      
            cp -f MMDVMDMR2NXDN.ini /home/pi/MMDVMHost
            cp -f MMDVMNXDN.ini /home/pi/MMDVMHost
            cp -f MMDVMDMR2YSF.ini /home/pi/MMDVMHost

            cp -f DMR2NXDN.ini  /home/pi/DMR2NXDN
            cp -f NXDNGateway.ini /home/pi/NXDNClients/NXDNGateway
            cp -f DMR2YSF.ini /home/pi/DMR2YSF

            sudo cp -f YSFGateway.ini /home/pi/YSFClients/YSFGateway/

            sudo cp -f BlueDVconfig.ini /home/pi/bluedv/

            sudo cp -f svxlink.conf /usr/local/etc/svxlink/
            
            sudo cp -f ModuleEchoLink.conf /usr/local/etc/svxlink/svxlink.d/

            cp ircddbgateway /usr/local/etc/opendv/
            cp dstarrepeater /usr/local/etc/opendv/

            cp info_panel_control.ini /home/pi/


indicativo=$(awk "NR==1" /home/pi/Downloads/datos_dvswitch)
           
sudo sed -i "2c Callsign=$indicativo" /opt/MMDVM_Bridge/MMDVM_Bridge.ini
sudo sed -i "2c Callsign=$indicativo" /opt/MMDVM_Bridge/brandmeister_esp.ini
sudo sed -i "2c Callsign=$indicativo" /opt/MMDVM_Bridge/dmrplus.ini
sudo sed -i "2c Callsign=$indicativo" /opt/MMDVM_Bridge/especial.ini
sudo sed -i "2c Callsign=$indicativo" /opt/NXDNGateway.ini
sudo sed -i "2c gatewayCallsign=$indicativo" /etc/ircddbgateway
sudo sed -i "95c ircddbUsername=$indicativo" /etc/ircddbgateway
sudo sed -i "117c dplusLogin=$indicativo" /etc/ircddbgateway
sudo sed -i "2c Callsign=$indicativo" /opt/MMDVM_Bridge/MMDVM_Bridge_FCS.ini
