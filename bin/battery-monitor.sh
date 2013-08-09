#!/bin/bash
# Script to send notifications every few minutes if battery life is exceedingly low.

batt=`acpi -b | grep "Discharging"`

if [[ $batt != "" ]];
then
  batt=`echo $batt | awk '{print $4}' | rev | cut -c 3- | rev`

  if [[ $batt -le 10 ]]
  then
    notify-send "Critical battery warning: "$batt"% remaining!!"
    sleep 60
  elif [[ $batt -le 20 ]];
  then
    notify-send "Low battery warning: "$batt"% remaining."
    sleep 120
  else
    sleep 300
  fi

else
  sleep 300
fi

