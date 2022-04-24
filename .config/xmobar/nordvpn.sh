#!/bin/bash

info=$(nordvpn status | sed "s/\r//g")

stat=$(echo "$info" | grep "Status" | sed "s/Status: //" | sed "s/-//g" | sed "s/ //g")

if [[ "$stat" == "Disconnected" ]]
then
	echo ""
	exit 0
fi

echo ""
