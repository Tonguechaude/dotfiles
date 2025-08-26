#!/bin/bash

# Script de contrôle power/GPU amélioré
# Gestion d'erreurs et notifications

# Fonctions utilitaires
notify_change() {
    local title="$1"
    local message="$2"
    local icon="$3"
    
    if command -v notify-send &> /dev/null; then
        notify-send -t 3000 -i "$icon" "$title" "$message"
    fi
    
    # Log pour debug
    echo "$(date): $title - $message" >> ~/.local/share/power-control.log
}

get_current_status() {
    local power_profile=""
    local gpu_mode=""
    
    # Récupération sécurisée du profil power
    if command -v asusctl &> /dev/null; then
        power_profile=$(asusctl profile -p 2>/dev/null || echo "Unknown")
    else
        power_profile="N/A"
    fi
    
    # Récupération sécurisée du mode GPU
    if command -v supergfxctl &> /dev/null; then
        gpu_mode=$(supergfxctl -g 2>/dev/null || echo "Unknown")
    else
        gpu_mode="N/A"
    fi
    
    echo "⚡ $power_profile | 󰍹 $gpu_mode"
}

# Mode cycle pour raccourci clavier
cycle_power_profile() {
    local current=$(asusctl profile -p 2>/dev/null)
    
    case "$current" in
        *"Silent"*)
            sudo asusctl profile -P Performance
            notify_change "Power Profile" "Switched to Performance" "applications-system"
            ;;
        *"Performance"*)
            sudo asusctl profile -P Turbo
            notify_change "Power Profile" "Switched to Turbo" "applications-system"
            ;;
        *)
            sudo asusctl profile -P Silent
            notify_change "Power Profile" "Switched to Silent" "applications-system"
            ;;
    esac
}

# Mode cycle pour GPU
cycle_gpu_mode() {
    local current=$(supergfxctl -g 2>/dev/null)
    
    case "$current" in
        *"Integrated"*)
            sudo supergfxctl -m Hybrid
            notify_change "GPU Mode" "Switched to Hybrid" "video-display"
            ;;
        *"Hybrid"*)
            sudo supergfxctl -m AsusMuxDgpu
            notify_change "GPU Mode" "Switched to Dedicated" "video-display"
            ;;
        *)
            sudo supergfxctl -m Integrated
            notify_change "GPU Mode" "Switched to Integrated" "video-display"
            ;;
    esac
}

# Menu principal
show_menu() {
    local status=$(get_current_status)
    
    local choice=$(echo -e \
        "󰓅 Performance\n󰾫 Silent\n󰩐 Turbo\n | \n󰍹 Integré\n󰢢 Hybride\n󰘚 Dédié\n | \n🔄 Cycle Power\n🔄 Cycle GPU" | \
        fuzzel --dmenu --lines 12 --placeholder="$status" --width 25)
    
    case "$choice" in
        "󰓅 Performance")
            sudo asusctl profile -P Performance && \
            notify_change "Power Profile" "Changed to Performance" "applications-system"
            ;;
        "󰾫 Silent")
            sudo asusctl profile -P Silent && \
            notify_change "Power Profile" "Changed to Silent" "applications-system"
            ;;
        "󰩐 Turbo")
            sudo asusctl profile -P Turbo && \
            notify_change "Power Profile" "Changed to Turbo" "applications-system"
            ;;
        "󰍹 Integré")
            sudo supergfxctl -m Integrated && \
            notify_change "GPU Mode" "Changed to Integrated" "video-display"
            ;;
        "󰢢 Hybride")
            sudo supergfxctl -m Hybrid && \
            notify_change "GPU Mode" "Changed to Hybrid" "video-display"
            ;;
        "󰘚 Dédié")
            sudo supergfxctl -m AsusMuxDgpu && \
            notify_change "GPU Mode" "Changed to Dedicated" "video-display"
            ;;
        "🔄 Cycle Power")
            cycle_power_profile
            ;;
        "🔄 Cycle GPU")
            cycle_gpu_mode
            ;;
    esac
}

# Arguments de ligne de commande
case "$1" in
    "cycle-power")
        cycle_power_profile
        ;;
    "cycle-gpu")
        cycle_gpu_mode
        ;;
    "status")
        get_current_status
        ;;
    *)
        show_menu
        ;;
esac

