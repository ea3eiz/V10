#!/bin/bash


                        echo "${VERDE}"
                        echo "*************************************************"
                        echo "*  ${ROJO}ADVERTENCIA!!!${VERDE}                               *"
                        echo "*  ${ROJO}AL INSTALAR ANYDESK SE REINICIARÁ EL SISTEMA${VERDE} *"
                        echo "*************************************************"
                        echo "${CIAN}" 
                        read -p 'Quieres instalar Anydesk ? S/N ' actualizar                                              
                        case $actualizar in
                        [sS]* ) echo ""
                        cd /home/pi
                        sudo rm -R .anydesk
                        echo "${VERDE}"
                        echo "*******************************************"
                        echo "*           INSTALANDO ANYDESK            *"
                        echo "*******************************************"
                        sleep 2  
                        echo "${GRIS}"                    
                        cd /home/pi/Downloads
                        sudo apt-get purge anydesk
                        wget https://download.anydesk.com/rpi/anydesk_5.5.3-1_armhf.deb
                        clear
                        sudo dpkg -i anydesk_5.5.3-1_armhf.deb
                        clear
                        echo "${VERDE}"
                        echo "*******************************************"
                        echo "*        SE HA INSTALADO ANYDESK          *"
                        echo "*******************************************"
                        sleep 2
                        clear
                        echo "${ROJO}"
                        echo "*******************************************"
                        echo "*        SE REINICIARÁ EL SISTEMA         *"
                        echo "*******************************************"
                        sleep 2
                        clear
                        echo "${AMARILLO}"
                        echo "*******************************************"
                        echo "*        SE REINICIARÁ EL SISTEMA         *"
                        echo "*******************************************"
                        sleep 2
                        clear
                        echo "${ROJO}"
                        echo "*******************************************"
                        echo "*        SE REINICIARÁ EL SISTEMA         *"
                        echo "*******************************************"
                        sleep 2
                        sudo reboot
                        break;;
                        [nN]* ) 
                        echo ""