E567U-   452#!/bin/bash
# -*- ENCODING: UTF-8 -*-
clear
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"

                    echo "${ROJO}"
                    echo " *********************************************************************"
                    echo " * Si actualizas MMDVMhost desde esta opción, perderás todas las     *"
                    echo " * configuraciones y tendrás que volver a configurar los .ini        *"
                    echo " *********************************************************************"
                    
                    echo "${BLANCO}"
                    echo " *********************************************************************"
                    echo " * Haz antes una copia de seguridad desde el icono COPIAR RESTAURAR   *"
                    echo " * O desde un navegador poniendo la ip de la raspberry pi y luego     *"
                    echo " * utiLiza el icono HACER COPIA SEGURIDAD el cual te creará           *"
                    echo " * el archivo [copia.tar.gz] en la carpeta Downloads de tu ordenador  *"
                    echo " *********************************************************************"                    

                    echo "${VERDE}"
                    read -p '  Quieres hacer la actualización? S/N: ' ejecutar1
                    case $ejecutar1 in
                    [sS]* ) echo ""
                    echo "ok >>>>>"
                    cd /home/pi 
                    sudo rm -r /home/pi/MMDVMHost
                    git clone https://github.com/g4klx/MMDVMHost
                    #git clone https://github.com/ea3eiz/MMDVMHost
                    cd /home/pi/MMDVMHost

                    HOY=$(date +%Y%m%d)
                    FIJA="const char* VERSION = "\"
                    PI="ADER10"\"
                    HOY1=$HOY$PI
                    PUNTO=";"   
                    
                    sed -i "22c $FIJA$HOY1$PUNTO" /home/pi/MMDVMHost/Version.h



sudo cp /home/pi/$SCRIPTS_version/YSFControl.cpp /home/pi/MMDVMHost



                    make clean
                    make

                    #Instala la secion [NextionDriver] en todos los .ini y todas sus memorias
                    cd /home/pi/NextionDriverInstaller
                    sudo ./NextionDriver_ConvertConfig /home/pi/MMDVMHost/MMDVM.ini
                    sleep 2                  
                    
                    # Crea los ejecutables para estas aplicaciones 
                    cd /home/pi/MMDVMHost
                    sudo cp MMDVMHost MMDVMBM
                    sudo cp MMDVMHost MMDVMPLUS
                    sudo cp MMDVMHost MMDVMDSTAR
                    sudo cp MMDVMHost MMDVMFUSION
                    sudo cp MMDVMHost DMR2NXDN
                    sudo cp MMDVMHost DMR2YSF
                    sudo cp MMDVMHost MMDVMNXDN
                    #=================================================

                    # Rutina solo para el LIBRE ======================
                    cd /home/pi/$SCRIPTS_version
                    cp MMDVMHostLIBRE /home/pi/MMDVMHost
                    cp MMDVMLIBRE.ini /home/pi/MMDVMHost
                    cd /home/pi/MMDVMHost
                    sudo chmod +x MMDVMHostLIBRE
                    #=================================================

                    
                    # Crea el fichero para que arranque NextionDriver ==================
                    cp MMDVM.ini MMDVM.ini_NextionDriver

                    # Crea los ficheros .ini y Memorias ==================
                    cp MMDVM.ini MMDVM.ini_original
                    cp MMDVM.ini MMDVM.ini_copia
                    cp MMDVM.ini MMDVM.ini_copia2
                    cp MMDVM.ini MMDVM.ini_copia3

                    cp MMDVM.ini MMDVMBM.ini
                    cp MMDVM.ini MMDVMBM.ini_copia
                    cp MMDVM.ini MMDVMBM.ini_copia2
                    cp MMDVM.ini MMDVMBM.ini_copia3

                    cp MMDVM.ini MMDVMPLUS.ini
                    cp MMDVM.ini MMDVMPLUS.ini_copia
                    cp MMDVM.ini MMDVMPLUS.ini_copia2
                    cp MMDVM.ini MMDVMPLUS.ini_copia3

                    cp MMDVM.ini MMDVMDSTAR.ini
                    cp MMDVM.ini MMDVMDSTAR.ini_copia
                    cp MMDVM.ini MMDVMDSTAR.ini_copia2
                    cp MMDVM.ini MMDVMDSTAR.ini_copia3

                    cp MMDVM.ini MMDVMFUSION.ini
                    cp MMDVM.ini MMDVMFUSION.ini_copia
                    cp MMDVM.ini MMDVMFUSION.ini_copia2
                    cp MMDVM.ini MMDVMFUSION.ini_copia3                 

                    cp MMDVMLIBRE.ini MMDVMLIBRE.ini_uno
                    cp MMDVMLIBRE.ini MMDVMLIBRE.ini_dos

                    cp MMDVM.ini TODOS_LOS_INIS.ini

                    cp MMDVM.ini MMDVMDMR2YSF.ini
                    
                    cp MMDVM.ini MMDVMDMR2NXDN.ini

                    cp MMDVM.ini MMDVMNXDN.ini


            #YSF2DMR
            sed -i "2c RXFrequency=435000000" /home/pi/YSF2DMR/YSF2DMR.ini
            sed -i "2c RXFrequency=435000000" /home/pi/YSF2DMR/YSF2DMR.ini_copia_01            
            sed -i "2c RXFrequency=435000000" /home/pi/YSF2DMR/YSF2DMR.ini_copia_02
            sed -i "2c RXFrequency=435000000" /home/pi/YSF2DMR/YSF2DMR.ini_copia_03
            sed -i "2c RXFrequency=435000000" /home/pi/YSF2DMR/YSF2DMR.ini_copia_04

            sed -i "3c TXFrequency=435000000" /home/pi/YSF2DMR/YSF2DMR.ini
            sed -i "3c TXFrequency=435000000" /home/pi/YSF2DMR/YSF2DMR.ini_copia_01            
            sed -i "3c TXFrequency=435000000" /home/pi/YSF2DMR/YSF2DMR.ini_copia_02
            sed -i "3c TXFrequency=435000000" /home/pi/YSF2DMR/YSF2DMR.ini_copia_03
            sed -i "3c TXFrequency=435000000" /home/pi/YSF2DMR/YSF2DMR.ini_copia_04

            sed -i "13c Callsign=G9BF" /home/pi/YSF2DMR/YSF2DMR.ini
            sed -i "13c Callsign=G9BF" /home/pi/YSF2DMR/YSF2DMR.ini_copia_01
            sed -i "13c Callsign=G9BF" /home/pi/YSF2DMR/YSF2DMR.ini_copia_02
            sed -i "13c Callsign=G9BF" /home/pi/YSF2DMR/YSF2DMR.ini_copia_03
            sed -i "13c Callsign=G9BF" /home/pi/YSF2DMR/YSF2DMR.ini_copia_04

            sed -i "8c Location=Nowhere" /home/pi/YSF2DMR/YSF2DMR.ini
            sed -i "8c Location=Nowhere" /home/pi/YSF2DMR/YSF2DMR.ini_copia_01
            sed -i "8c Location=Nowhere" /home/pi/YSF2DMR/YSF2DMR.ini_copia_02
            sed -i "8c Location=Nowhere" /home/pi/YSF2DMR/YSF2DMR.ini_copia_03
            sed -i "8c Location=Nowhere" /home/pi/YSF2DMR/YSF2DMR.ini_copia_04

            sed -i "10c URL=www.google.co.uk" /home/pi/YSF2DMR/YSF2DMR.ini
            sed -i "10c URL=www.google.co.uk" /home/pi/YSF2DMR/YSF2DMR.ini_copia_01
            sed -i "10c URL=www.google.co.uk" /home/pi/YSF2DMR/YSF2DMR.ini_copia_02
            sed -i "10c URL=www.google.co.uk" /home/pi/YSF2DMR/YSF2DMR.ini_copia_03
            sed -i "10c URL=www.google.co.uk" /home/pi/YSF2DMR/YSF2DMR.ini_copia_04

            sed -i "26c Id=1234567" /home/pi/YSF2DMR/YSF2DMR.ini
            sed -i "26c Id=1234567" /home/pi/YSF2DMR/YSF2DMR.ini_copia_01
            sed -i "26c Id=1234567" /home/pi/YSF2DMR/YSF2DMR.ini_copia_02
            sed -i "26c Id=1234567" /home/pi/YSF2DMR/YSF2DMR.ini_copia_03
            sed -i "26c Id=1234567" /home/pi/YSF2DMR/YSF2DMR.ini_copia_04

            sed -i "5c Latitude=0.0" /home/pi/YSF2DMR/YSF2DMR.ini
            sed -i "5c Latitude=0.0" /home/pi/YSF2DMR/YSF2DMR.ini_copia_01
            sed -i "5c Latitude=0.0" /home/pi/YSF2DMR/YSF2DMR.ini_copia_02
            sed -i "5c Latitude=0.0" /home/pi/YSF2DMR/YSF2DMR.ini_copia_03
            sed -i "5c Latitude=0.0" /home/pi/YSF2DMR/YSF2DMR.ini_copia_04

            sed -i "6c Longitude=0.0" /home/pi/YSF2DMR/YSF2DMR.ini
            sed -i "6c Longitude=0.0" /home/pi/YSF2DMR/YSF2DMR.ini_copia_01
            sed -i "6c Longitude=0.0" /home/pi/YSF2DMR/YSF2DMR.ini_copia_02
            sed -i "6c Longitude=0.0" /home/pi/YSF2DMR/YSF2DMR.ini_copia_03
            sed -i "6c Longitude=0.0" /home/pi/YSF2DMR/YSF2DMR.ini_copia_04 

            #DMR2NXDN.ini
            sed -i "10c Id=1234567" /home/pi/DMR2NXDN/DMR2NXDN.ini

            #NXDNGateway.ini
            sed -i "11c RXFrequency=435000000" /home/pi/NXDNClients/NXDNGateway/NXDNGateway.ini

            sed -i "12c TXFrequency=435000000" /home/pi/NXDNClients/NXDNGateway/NXDNGateway.ini

            sed -i "2c Callsign=G9BF" /home/pi/NXDNClients/NXDNGateway/NXDNGateway.ini

            #DMR2YSF.ini
            sed -i "2c Callsign=G9BF" /home/pi/DMR2YSF/DMR2YSF.ini

            sed -i "12c Id=1234567" /home/pi/DMR2YSF/DMR2YSF.ini

            sed -i "2c Callsign=G9BF" /home/pi/YSFClients/YSFGateway/YSFGateway.ini
            sed -i "13c RXFrequency=435000000" /home/pi/YSFClients/YSFGateway/YSFGateway.ini
            sed -i "14c TXFrequency=435000000" /home/pi/YSFClients/YSFGateway/YSFGateway.ini
            sed -i "19c Name=Nowhere" /home/pi/YSFClients/YSFGateway/YSFGateway.ini
            sed -i "5c Id=1234567" /home/pi/YSFClients/YSFGateway/YSFGateway.ini
            sed -i "16c Longitude=0.0" /home/pi/YSFClients/YSFGateway/YSFGateway.ini
            sed -i "17c Latitude=0.0" /home/pi/YSFClients/YSFGateway/YSFGateway.ini





                    #=================================================

                    sudo chmod +x -R /home/pi/MMDVMHost
                    
                    echo""
                    clear
                    exit;
                    echo ""
                    echo "Ok, se ha ejecutado correctamente"
                    echo ""
                    ;;
                    [nN]* ) echo ""
                    ;;
                    esac
                    sleep 1
                    clear
                    exit;
