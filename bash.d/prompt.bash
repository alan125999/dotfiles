#!/usr/bin/env bash

# ======================================================== #
#                      Prompt Settings                     #
# ======================================================== #
# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color|xterm-kitty) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

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
PS_SU_USER="\[$C_YELLOW\]$PS_REAL_USER -> \[$C_ORANGE\]$PS_EUSER"
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

