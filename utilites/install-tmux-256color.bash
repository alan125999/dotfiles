#!/usr/bin/env bash

# This script is designed for macOS
# macOS has ncurses version 5.7 which doesn't ship the terminfo description for tmux.
# ==============================================================================


# Set Bash Strict Mode
set -euo pipefail
IFS=$' \n\t'



# Firstly, we need to install latest version of ncurses by using brew.
echo -e "\nInstall ncurse from brew..."
brew list ncurses > /dev/null || brew install ncurses

# After that, we're going to use infocmp that prints a terminfo description.
echo -e "\nGenerate terminfo of tmux-256color"
/usr/local/opt/ncurses/bin/infocmp tmux-256color > /tmp/tmux-256color.info && echo 'OK'

# Finally, we need to compile the description to our system database
#echo "\nCompile terminfo to system database"
#sudo tic -xe tmux-256color tmux-256color.info

# Or, compile for current user only.
echo -e "\nCompile terminfo for current user only"
mkdir -p $HOME/.terminfo/ && tic -xe tmux-256color /tmp/tmux-256color.info && echo 'OK'

# Check terminfo has been installed
echo -e "\nCheck terminfo has been installed"
infocmp tmux-256color | head


