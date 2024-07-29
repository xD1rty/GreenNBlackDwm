#!/bin/bash
status=$(playerctl -p spotify status)
artist=$(playerctl -p spotify metadata artist)
album=$(playerctl -p spotify metadata album)
title=$(playerctl -p spotify metadata title)
length=$(playerctl -p spotify metadata mpris:length | sed 's/.\{6\}$//')

echo "$artist - $title"
