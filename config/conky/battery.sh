#!/bin/bash

# script to return the battery time remaining, if not on AC power.

batt=`acpi -b | grep "Discharging"`

if [[ $batt != "" ]];
then

  batt=`echo $batt | awk '{print $5}' | cut -c 1-5`
  echo " (-"$batt")"

fi

batt=`acpi -b | grep "Charging"`

if [[ $batt != "" ]];
then

  batt=`echo $batt | awk '{print $5}' | cut -c 1-5`
  echo " (+"$batt")"

fi
