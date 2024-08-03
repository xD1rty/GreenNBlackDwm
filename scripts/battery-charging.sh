export XAUTHORITY=~/.Xauthority
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

BATTERY_STATE=$1
BATTERY_LEVEL=$(acpi -b | grep "Battery 0" | grep -P -o '[0-9]+(?=%)')
case "$BATTERY_STATE" in
	"charging") BATTERY_CHARGING="Charging" ; BATTERY_ICON="charging" ;;
	"discharging") BATTERY_CHARGING="Disharging" ; BATTERY_ICON="discharging" ;;
esac

# Send notification
notify-send "${BATTERY_CHARGING}" "${BATTERY_LEVEL}% of battery charged." -u normal -t 5000 -r 9991