
#!/bin/bash

# Source directory where your config folders/files are located
SRC_DIR="$(pwd)"  # Change this if needed

# List of directories/files to copy
CONFIG_ITEMS=(
    ags
    bashrc
    dunst
    fastfetch
    fish
    gtk-3.0
    gtk-4.0
    hypr
    kitty
    lvim
    ml4w
    nvim
    nwg-dock-hyprland
    ohmyposh
    qt6ct
    rofi
    vim
    wal
    waybar
    waypaper
    xsettingsd
    zshrc
)

# Ensure ~/.config exists

# Copy each item
for item in "${CONFIG_ITEMS[@]}"; do
    if [ -e "$HOME/.config/$item" ]; then
        cp -r  "$HOME/.config/$item" "$SRC_DIR/config"
        echo "Copied $item → ~/.config/"
    else
        echo "⚠️  $item not found in $SRC_DIR, skipping."
    fi
done

echo "✅ All done!"


