#!/bin/bash

sudo mount -o remount,rw /
sudo systemctl daemon-reload




sudo ip addr add 192.168.180.13 dev end0

sudo ip link set end0 up

sudo ifconfig end0 192.168.180.12 up
sleep 5
sudo ping 192.168.180.100 -c 4
sudo /home/das/DAS_DTS_14/DAS_prog

# chmod +x ***.sh
