#!/bin/bash

# Paths
path="skibid"
PYWAL_COLORS_CSS="$HOME/.cache/wal/colors.css"
HYPRLAND_COLORS_CONF="$HOME/.config/hypr/configs/colors.conf"

# Function to get the wallpaper path from waypaper
get_wallpaper_path() {
    echo "[debug]::retrieving wallpaper path from waypaper"
    wallpaper_info=$(waypaper --list)
    wallpaper_path=$(echo "$wallpaper_info" | grep -oP '(?<="wallpaper": ")[^"]+')
    
    if [[ -z $wallpaper_path ]]; then
        echo "[error]::failed to retrieve wallpaper path from waypaper"
        exit 1
    fi

    path="$wallpaper_path"

    echo "$wallpaper_path"
}

# Update hyprland window border colors
update_hyprland_colors() {
    # Parse pywal colors
    echo "[Debug]::Parsing pywal colors"
    fg_hex=$(grep -oP '(?<=--color11: )#[0-9a-fA-F]+' "$PYWAL_COLORS_CSS") || { echo "[Error]::Failed to parse fg color"; exit 1; }
    bg_hex=$(grep -oP '(?<=--color0: )#[0-9a-fA-F]+' "$PYWAL_COLORS_CSS") || { echo "[Error]::Failed to parse bg color"; exit 1; }

    # Convert hex colors to ARGB
    echo "[Debug]::Converting hex colors to ARGB"
    fg=$(hex_to_argb "$fg_hex")
    bg=$(hex_to_argb "$bg_hex")
    echo "[Info]::Foreground color: $fg"
    echo "[Info]::Background color: $bg"

    # Update colors.conf
    echo "[Debug]::Updating colors.conf"
    if [[ -n $fg && -n $bg ]]; then
        : > "$HYPRLAND_COLORS_CONF"
        echo "\$fg = $fg" >> "$HYPRLAND_COLORS_CONF"
        echo "\$bg = $bg" >> "$HYPRLAND_COLORS_CONF"
    else
        echo "[Error]::Could not extract or convert colors."
        exit 1
    fi
}

hex_to_argb() {
    local hex="$1"
    local alpha="b3"
    local rr="${hex:1:2}"
    local gg="${hex:3:2}"
    local bb="${hex:5:2}"
    echo "0x${alpha}${rr}${gg}${bb}"
}


# Generate pywal colors
generate_pywal_colors() {


    local wallpaper_path=$path
    
    echo "[Debug]::Generating pywal colors"
    wal -i "$wallpaper_path" || { echo "[Error]::Failed to generate pywal colors"; exit 1; }
}


# Main

WALLPAPER_PATH=$(get_wallpaper_path)

if [[ -n $WALLPAPER_PATH ]]; then
    get_wallpaper_path
    generate_pywal_colors "$WALLPAPER_PATH"

    update_hyprland_colors
    sh $HOME/pywal-discord/pywal-discord -t abou
    sh $HOME/.config/waypaper/setwaybarColor.sh
    echo $path | grep -oP '/.*' > ~/.config/ml4w/cache/current_wallpaper
    echo "[Success]::Wallpaper changed successfully."
else
       echo "[Error]::No wallpaper path found."

    exit 1

fi
   
