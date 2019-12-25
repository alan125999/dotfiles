#!/usr/bin/env bash

### Set Shell Prompt

# Prototype - Just for backup
# PS1="\n\h: \w\n\A \u \\$ \[$(tput sgr0)\]"

# The variables here may need to be replace in different system
PS_REAL_USER=$SUDO_USER
PS_EUSER='\u'

function isSudoing(){
    ! [[ -z "$SUDO_USER" ]]
}

# 16 Colors
function set-16-color() {
    C_GREEN='\e[1;38;5;82m'
    C_BLUE='\e[36;1m'
    C_PINK='\e[35;1m'
    C_YELLOW='\e[33;1m'
    C_ORANGE='\e[31;1m'
    C_RED='\e[31;1m'
    C_RESET='\e[m'
}

# 256 Colors
function set-256-color() {
    C_GREEN='\e[1;38;5;82m'
    C_BLUE='\e[1;38;5;87m'
    C_PINK='\e[1;38;5;218m'
    C_YELLOW='\e[1;38;5;226m'
    C_ORANGE='\e[1;38;5;214m'
    C_RED='\e[1;38;5;9m'
    C_RESET='\e[m'
}

# Set Color
set-256-color

# Modulize PS1 Code
PS_HOST="\[$C_GREEN\]\h"
PS_PWD="\[$C_BLUE\]\w"
PS_TIME="\[$C_PINK\]\A"
PS_USER="\[$C_YELLOW\]\u"
PS_SU_USER="\[$C_YELLOW\]$PS_REAL_USER -> \[$C_ORAGNE\]$PS_EUSER"
PS_PROMPT="\[$C_RED\]\\$"
PS_END="\[${C_RESET}$(tput sgr0)\]" # Reset Cursor status

# Check Sudoing
if isSudoing ; then
    PS_USER="$PS_SU_USER"
fi

# Set Prompt
PS1="\n"
PS1+="$PS_HOST: $PS_PWD\n"
PS1+="$PS_TIME $PS_USER $PS_PROMPT $PS_END"

