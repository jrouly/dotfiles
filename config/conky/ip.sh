#! /bin/bash

if [ $(cat /sys/class/net/wlan0/operstate) == "up" ];
then
  echo $(ip a show wlan0 | grep "inet " | awk '{ print $2 }')
fi

if [ $(cat /sys/class/net/eth0/operstate) == "up" ];
then
  echo $(ip a show eth0 | grep "inet " | awk '{ print $2 }')
fi
