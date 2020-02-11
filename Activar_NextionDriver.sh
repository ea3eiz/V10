#!/bin/bash
sudo sed -i "4c Exec=sh -c 'cd /home/pi/NextionDriver/;sudo ./NextionDriver -c /home/pi/MMDVMHost/MMDVM.ini'" /home/pi/.config/autostart/nextiondriver.desktop
echo "************************************************"
echo "  Si activas NextionDriver no funcionará "
echo "  La funciona la china pinchada en la raspberry"
echo "************************************************"

read a