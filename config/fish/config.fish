# Remove the fish greetings
set -g fish_greeting
set -g fish_key_bindings fish_default_key_bindings
set -Ua fish_features no-keyboard-protocols
# Start neofetch
neofetch

fortune

# Sets starship as the promt
eval (starship init fish)

# Start atuin
atuin init fish | source

# List Directory
alias l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree




