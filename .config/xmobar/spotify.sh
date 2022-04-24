#!/bin/bash

stat=$(playerctl status -p spotifyd)

if [[ $stat == "Playing" ]]; then
	title=$(playerctl metadata title)
	artist=$(playerctl metadata artist)

	tshortened=$(echo "$title" | grep -oE "(.{32})" | head -1)

	if [[ $tshortened == "" ]]; then
		        tshortened=$title
	fi

	if [[ $tshortened != $title ]]; then
		        tshortened="${tshortened}..."
	fi

	echo "${tshortened} - ${artist}"
else
	echo "Nothing is playing."
fi
