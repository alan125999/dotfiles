### Enable 256 color
export CLICOLOR=1

### Set Shell Prompt

# The variables here may need to be replace in different system
PS_RealUser=$SUDO_USER
PS_EUser='\u'
function isSudoing(){
    [[ -z ${SUDO_USER+x} ]]
}

# For non-color terminal, Comment  all these PS_Color below
# 16 Colors
# PS_Color_Hostname='\e[32;1m'
# PS_Color_DirLocation='\e[36;1m'
# PS_Color_Time='\e[35;1m'
# PS_Color_User='\e[33;1m'
# PS_Color_EUser='\e[31;1m'
# PS_Color_Prompt='\e[31;1m'
# PS_Color_Reset='\e[m'

# 256 Colors
PS_Color_Hostname='\e[1;38;5;82m'
PS_Color_DirLocation='\e[1;38;5;87m'
PS_Color_Time='\e[1;38;5;218m'
PS_Color_User='\e[1;38;5;226m'
PS_Color_EUser='\e[1;38;5;214m'
PS_Color_Prompt='\e[1;38;5;9m'
PS_Color_Reset='\e[m'

# Modulize PS1 Code
PS_Hostname="\[$PS_Color_Hostname\]\h"
PS_DirLocation="\[$PS_Color_DirLocation\]\w"
PS_Time="\[$PS_Color_Time\]\A"
PS_User="\[$PS_Color_User\]\u"
PS_sudo_User="\[$PS_Color_User\]$PS_RealUser -> \[$PS_Color_EUser\]$PS_EUser"
PS_Prompt="\[$PS_Color_Prompt\]\\$"
PS_End="\[`echo $PS_Color_Reset`\]\[$(tput sgr0)\]" # Reset Cursor status

# Setting PS1
if isSudoing ; then # if the variable SUDO_USER is not exist
    PS1="\n"
    PS1+="$PS_Hostname: $PS_DirLocation\n"
    PS1+="$PS_Time $PS_User $PS_Prompt $PS_End"
else
    PS1="\n"
    PS1+="$PS_Hostname: $PS_DirLocation\n"
    PS1+="$PS_Time $PS_sudo_User $PS_Prompt $PS_End"
fi

# Prototype - Just for backup
#PS1="\n\h: \w\n\A \u \\$ \[$(tput sgr0)\]"

### History Search
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

