#! /bin/bash

if [ $(cat /sys/class/net/wlp2s0/operstate) == "up" ];
then
  echo $(ip a show wlp2s0 | grep "inet " | awk '{ print $2 }')
elif [ $(cat /sys/class/net/enp1s0/operstate) == "up" ];
then
  echo $(ip a show enp1s0 | grep "inet " | awk '{ print $2 }')
else
  echo "No IP"
fi
