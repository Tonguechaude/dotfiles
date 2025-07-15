#!/bin/bash

power_profile=$(asusctl profile -p)
MONITOR_NAME=$(hyprctl -j monitors | jq -r '.[] | select(.focused) | .name')
current_mode=$(hyprctl monitors | grep -A 2 "Monitor $MONITOR_NAME" | grep -oP '[0-9]+x[0-9]+@[0-9.]+')
gpu_mode=$(supergfxctl -g)

# La variable status doit être sur une seule ligne
status="⚡ $power_profile | 󰍹 $gpu_mode"

# Suppression des parenthèses dans le menu
choice=$(echo -e \
        "󰓅 Performance\n󰾫 Silent\n󰩐 Turbo\n | \nIntegré\n󰢢 Hybride\n󰘚 Dédié" | \
        fuzzel --dmenu --lines 10 --placeholder="$status")


# Suppression des parenthèses dans les cas correspondants
case "$choice" in
    "󰓅 Performance")
        sudo asusctl profile -P Performance
        ;;
    "󰾫 Silent")
        sudo asusctl profile -P Silent
        ;;
    "󰩐 Turbo")
        sudo asusctl profile -P Turbo
        ;;
    "Integré")
        sudo supergfxctl -m Integrated
        ;;
    "󰢢 Hybride")
        sudo supergfxctl -m Hybrid
        ;;
    "󰘚 Dédié")
        sudo supergfxctl -m AsusMuxDgpu
        ;;
esac
