#!/bin/bash

event=$1
label=$2
size=$(lsblk $4 -o SIZE | tail -1 | sed "s/ //")

# Exit if drive doesn't end in a number (for example, /dev/sdc).
if [[ "$(echo "${4}" | sed "s/\/dev\/[a-z]*//g" | grep -e "[0-9]" | wc -l)" == 0 ]]; then
	exit 0
fi

if [[ $event == "device_mounted" ]]; then
	notify-send --urgency=low "Mount - ${4}" "\"${2}\", ${size} ${3} medium mounted."
fi

if [[ $event == "device_removed" ]]; then
	notify-send --urgency=low  "Unmount - ${4}" "\"${2}\", ${3} medium unmounted."
fi
