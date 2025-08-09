#!/bin/bash

# Try to get the current wallpaper path from Waypaper's config
if [ -f "$HOME/.config/waypaper/wallpaper.path" ]; then
    wallpaper_path=$(cat "$HOME/.config/waypaper/wallpaper.path")
elif [ -f "$HOME/.config/waypaper/config.ini" ]; then
    # Extract the wallpaper path from the config.ini file
    wallpaper_path=$(grep "wallpaper=" "$HOME/.config/waypaper/config.ini" | cut -d= -f2)
elif [ -L "$HOME/.cache/waypaper/wallpaper.jpg" ]; then
    # Get the path from the symbolic link
    wallpaper_path=$(readlink -f "$HOME/.cache/waypaper/wallpaper.jpg")
else
    echo "Could not find current Waypaper wallpaper path"
    exit 1
fi

# Print the path (for debugging)
echo "Using wallpaper: $wallpaper_path"

# Run wal to generate colors from the wallpaper
wal -i "$wallpaper_path"

# Restart Waybar to apply new colors
