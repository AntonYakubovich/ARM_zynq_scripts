#!/bin/bash
#если не поставлен i2ctools то сначала
#sudo apt update
#sudo apt install i2c-tools
#перед запуском скрипта повышаем ему права
#sudo chmod +x reset_rtc8564.sh
#копирование папки с модулями 
#sudo cp -r modules /lib


echo "Сбрасываем часы на i2c шине"
echo "выгружаем драйвер "
sudo modprobe -r rtc_pcf8563
echo " Дамп регистров"
sudo i2cdump -y 0 0x51
echo "Сбрасываем секунды"
sudo i2cset 0 0x51 0x02 0x00 -y
echo "Сбрасываем минуты"
sudo i2cset 0 0x51 0x03 0x00 -y
echo "Сбрасываем часы"
sudo i2cset 0 0x51 0x04 0x00 -y
echo "Сбрасываем день"
sudo i2cset 0 0x51 0x05 0x24 -y
echo "Сбрасываем день недели"
sudo i2cset 0 0x51 0x06 0x02 -y
echo "Сбрасываем месяц и ставим тысячелетие"
sudo i2cset 0 0x51 0x07 0x86 -y
echo "Сбрасываем год"
sudo i2cset 0 0x51 0x08 0x25 -y
echo "Сбрасываем минуты будильника"
sudo i2cset 0 0x51 0x09 0x00 -y
echo "Сбрасываем часы будильника"
sudo i2cset 0 0x51 0x0a 0x00 -y
echo "Сбрасываем день недели будильника"
sudo i2cset 0 0x51 0x0b 0x02 -y
echo "Сбрасываем день недели будильника"
sudo i2cset 0 0x51 0x0c 0x02 -y
echo "Сбрасываем clkout register 1 Hz"
sudo i2cset 0 0x51 0x0d 0x03 -y
echo "Сбрасываем register 1 0x0e"
sudo i2cset 0 0x51 0x0e 0x03 -y
echo "Сбрасываем reg 0x0f"
sudo i2cset 0 0x51 0x0f 0x00 -y
echo "Делаем общий ресет"
sudo i2cset 0 0x51 0x00 0x00 -y
sudo i2cdump -y 0 0x51
echo "Загружаем драйвер обратно"
sudo modprobe rtc-pcf8563
echo "Показываем время"
timedatectl
