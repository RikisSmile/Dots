
#!/bin/bash 

hyprctl dispatch exec "firefox --new-tab "localhost:8123" "

sleep 2

hyprctl dispatch workspace 2 
hyprctl dispatch exec "vscodium"

sleep 2

hyprctl dispatch workspace 3 
hyprctl dispatch exec "spotify"

sleep 2

hyprctl dispatch workspace 4
hyprctl dispatch exec "kitty -e gtop" 

sleep 0.8
hyprctl dispatch workspace 1






