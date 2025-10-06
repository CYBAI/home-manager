# Default shell to fish
set -gx SHELL (command -v fish)

mise activate fish | source

export HOSTNAME=$(scutil --get LocalHostName)

