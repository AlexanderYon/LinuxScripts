#! /bin/bash
PREVIOUS=""
while true; do
    STATUS=$(cat /sys/class/power_supply/BAT1/status)
    if [ "$STATUS" != "$PREVIOUS" ]; then
        if [ "$STATUS" = "Not charging" ]; then
            notify-send "󱟢 Battery" "Full Battery"
        else
            notify-send "󰂄 Battery" "$STATUS Battery"
        fi
        PREVIOUS="$STATUS"
    fi
    sleep 1
done
