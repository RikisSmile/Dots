#!/bin/bash

# Path to your JSON file
json_file="$HOME/.cache/wal/colors.json"

# Extract background and foreground colors using jq
background=$(jq -r '.special.background' "$json_file")
foreground=$(jq -r '.special.foreground' "$json_file")
colorForIcon=$(jq -r '.colors.color10' "$json_file")
colorForActiveBg=$(jq -r '.colors.color0' "$json_file")
colorForActiveFg=$(jq -r '.colors.color1' "$json_file")




# Path to your Waybar CSS file
waybar_css="$HOME/.config/waybar/theme.css"

# Update Waybar CSS file with the new colors
sed -i "s/@define-color main-bg .*/@define-color main-bg $background;/g" "$waybar_css"
sed -i "s/@define-color main-fg .*/@define-color main-fg $foreground;/g" "$waybar_css"


sed -i "s/@define-color active-bg .*/@define-color active-bg $colorForActiveBg;/g" "$waybar_css"
sed -i "s/@define-color active-fg .*/@define-color active-fg $colorForActiveFg ;/g" "$waybar_css"
sed -i "s/@define-color distro-bg .*/@define-color distro-bg  $colorForIcon;/g" "$waybar_css"

echo "Waybar colors updated:"
echo "Background: $background"
echo "Foreground: $foreground"
echo "Abg: $colorForActiveBg"
echo "Affg: $colorForActiveFg"
echo "Icon: $colorForIcon"
