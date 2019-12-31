#!/bin/sh

# Use 'command -v <cmd>' to check if it exist.
check_command_exist() {
    command -v $1 >/dev/null 2>&1
    return $?
}

# If realpath does not exist, do the polyfill
if ! check_command_exist 'realpath' ; then

    # Simple realpath function, which cannot dereference symbolic link.
    realpath() {
        [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
    }
fi

get_script_location() {
    DIR=${0%/*}
    ABS_DIR=$(realpath "$DIR")
    echo $ABS_DIR
}

get_epoch_day() {
    echo $(expr $(date +%s) / 60 / 60 / 24)
}

# ------------------------------------------------------------------------------

# Env
SCRIPTS_DIR=$(get_script_location)
DOTFILES_DIR=$(dirname ${SCRIPTS_DIR})
FLAG_FILE="${DOTFILES_DIR}/.update"
TARGET_DAYS=13

update_flag() {
    echo "LAST_EPOCH=$(get_epoch_day)" > $FLAG_FILE
}

update_repo() {
    echo "Check update of dotfiles from github? [y/N] "
    read ans
    if [ s"$ans" == s"y" ] || [ s"$ans" == s"Y" ]; then
        ( cd $DOTFILES_DIR && git pull && update_flag )
    fi
}

# Do update
[ -w $DOTFILES_DIR ] && check_command_exist 'git' || exit 1

if ! [ -f $FLAG_FILE ]; then
    update_flag
else
    . $FLAG_FILE
    if [ -z "$LAST_EPOCH" ] || [ $(expr $(get_epoch_day) - $LAST_EPOCH) -gt $TARGET_DAYS ]; then
        update_repo
    fi
fi

