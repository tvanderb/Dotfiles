#!/bin/bash
device=$(pacmd list-sinks | grep -e "* index:" | sed "s/  \* index: //g")
pactl get-sink-volume $device | grep -oE '([0-9][0-9][0-9]?%)' | head -1
