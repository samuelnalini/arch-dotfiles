#!/bin/bash

# Settings
THRESHOLD_WARNING=20
THRESHOLD_CRITICAL=10

BATTERY_PATH="/sys/class/power_supply/BAT0"

WARNING_TITLE="Battery Low"
WARNING_MESSAGE="Battery level is low!"
CRITICAL_TITLE="Battery Critical"
CRITICAL_MESSAGE="Battery level is critical!"

SOUND_PLAYER="paplay"
ACPI_CMD="acpi -b"

WARNING_SOUND="$HOME/.config/hypr/Sounds/battery_warning.mp3"

# Flags to prevent repeated notifications
sent_warning=false
sent_critical=false

notification_id_warning=0
notification_id_critical=0

while true; do
    battery_status=$(acpi -b)

    capacity=$(echo "$battery_status" | awk '{print $4}' | sed 's/[^0-9]//g')
    status=$(echo "$battery_status" | awk '{print $3}')

    if [[ "$status" == "Charging," ]]; then
	    charging=1
    else
	    charging=0
    fi


    if [[ "$charging" -eq 1 ]]; then

	    if [ "$sent_warning" = true ]; then
		    notify-send -r $notification_id_warning -u low "Charging" "Battery charging"
		    sent_warning=false
		    sent_critical=false
	    elif [ "$sent_critical" = true ]; then
		    notify-send -r $notification_id_critical -u low "Charging" "Battery charging"
		    sent_critical=false
		    sent_warning=false
	    fi
    else
	    if [ "$capacity" -le "$THRESHOLD_CRITICAL" ] && [ "$sent_critical" = false ]; then
		    notify-send -r $notification_id_critical -u critical "$CRITICAL_TITLE" "$CRITICAL_MESSAGE"
		    [ -f "$WARNING_SOUND" ] && $SOUND_PLAYER "$WARNING_SOUND"
		    sent_critical=true
	    elif [ "$capacity" -le "$THRESHOLD_WARNING" ] && [ "$sent_warning" = false ]; then
		    notify-send -r $notification_id_warning -u normal "$WARNING_TITLE" "$WARNING_MESSAGE"
		    [ -f "$WARNING_SOUND" ] && $SOUND_PLAYER "$WARNING_SOUND"
		    sent_warning=true
	    fi
    fi

    sleep 60
done
