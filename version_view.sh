#!/usr/bin/env bash
sudo busybox devmem 0x43c00000 1> content
line=$(cat content)
#echo $line
echo $((line))
rm content
