#!/bin/bash
# Script to send notifications if battery life is low.

low_lvl=30
verylow_lvl=20
critical_lvl=10

low_icon=/usr/share/icons/gnome/256x256/status/battery-low.png
verylow_icon=/usr/share/icons/gnome/256x256/status/battery-caution.png
critical_icon=/usr/share/icons/gnome/256x256/status/battery-empty.png

# Only send notifications if battery is discharging.
batt=`acpi -b | grep "Discharging"`
if [[ $batt != "" ]];
then

  # Grab the actual battery level from acpi.
  batt=`echo $batt | awk '{print $4}' | rev | cut -c 3- | rev`

  # BATTERY CRITICAL
  if [[ $batt -le $critical_lvl ]];
  then
    notify-send -u critical -i $critical_icon "Critical battery warning: "$batt"% remaining."

  # BATTERY VERY LOW
  elif [[ $batt -le $verylow_lvl ]];
  then
    notify-send -u critical -i $verylow_icon "Very low battery warning: "$batt"% remaining."

  # BATTERY LOW
  elif [[ $batt -le $low_lvl ]];
  then
    notify-send -u critical -i $low_icon "Low battery warning: "$batt"% remaining."
  fi

fi
