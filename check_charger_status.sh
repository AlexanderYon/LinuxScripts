#! /bin/bash

# Script to notify changes on battery status.

PREVIOUS=""
while true; do
    STATUS=$(cat /sys/class/power_supply/BAT1/status)

    # If there was a change on battery status
    if [ "$STATUS" != "$PREVIOUS" ]; then
        if [ "$STATUS" = "Not charging" ]; then
            notify-send "󱟢 Battery" "Full Battery" # Notify when it's fully charged
        else
            notify-send "󰂄 Battery" "$STATUS Battery" # Notify when the status changed (you connect or disconnect the power source)
        fi
        PREVIOUS="$STATUS"
    fi
    sleep 1
done
