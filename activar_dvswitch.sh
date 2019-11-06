#!/bin/bash
sudo systemctl start analog_bridge.service
sudo systemctl start ircddbgateway.service
sudo systemctl start md380-emu.service
sudo systemctl start mmdvm_bridge.service
sudo systemctl start nxdngateway.service