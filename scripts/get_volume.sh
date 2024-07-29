pactl get-sink-volume $(pactl get-default-sink) | awk -F ' ' 'NR<2 {print $5 " " $7}'
