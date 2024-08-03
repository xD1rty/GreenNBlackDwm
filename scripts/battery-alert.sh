WARNING_LEVEL=20
CRITICAL_LEVEL=5
BATTERY_DISCHARGING=$(acpi -b | grep "Battery 0" | grep -c "Discharging")
BATTERY_LEVEL=$(acpi -b | grep "Battery 0" | grep -P -o '[0-9]+(?=%)')

FULL_FILE=/tmp/batteryfull
EMPTY_FILE=/tmp/batteryempty
CRITICAL_FILE=/tmp/batterycritical

if [ "$BATTERY_DISCHARGING" -eq 1 ] && [ -f $FULL_FILE ]; then
	rm $FULL_FILE
elif [ "$BATTERY_DISCHARGING" -eq 0 ] && [ -f $EMPTY_FILE ]; then
	rm $EMPTY_FILE
fi

if [ "$BATTERY_LEVEL" -gt 99 ] && [ "$BATTERY_DISCHARGING" -eq 0 ] && [ ! -f $FULL_FILE ]; then
	notify-send "Battery Charged" "Battery is fully charged." -r 9991
	touch $FULL_FILE
elif [ "$BATTERY_LEVEL" -le $WARNING_LEVEL ] && [ "$BATTERY_DISCHARGING" -eq 1 ] && [ ! -f $EMPTY_FILE ]; then
	notify-send "Low Battery" "${BATTERY_LEVEL}% of battery remaining." -u critical -r 9991
	touch $EMPTY_FILE
elif [ "$BATTERY_LEVEL" -le $CRITICAL_LEVEL ] && [ "$BATTERY_DISCHARGING" -eq 1 ] && [ ! -f $CRITICAL_FILE ]; then
	notify-send "Battery Critical" "The computer will shutdown soon." -u critical -r 9991
	touch $CRITICAL_FILE
	fi