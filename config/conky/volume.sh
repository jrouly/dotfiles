#! /bin/bash
amixer get Master | awk -F'[]%[]' '/%/ {if ($7 == "off") { print "mute" } else { print $2"%" }}'
