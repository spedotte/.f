# This script was automatically generated by the broot program
# More information can be found in https://github.com/Canop/broot
# This function starts broot and executes the command
# it produces, if any.
# It's needed because some shell commands, like `cd`,
# have no useful effect if executed in a subshell.
function br {
    local cmd cmd_file code
    cmd_file=$(mktemp)
    if broot --outcmd "$cmd_file" "$@"; then
        cmd=$(<"$cmd_file")
        command rm -f "$cmd_file"
        eval "$cmd"
    else
        code=$?
        command rm -f "$cmd_file"
        return "$code"
    fi
}


# ADDED MANUALLY
# To prevent broot from complaining every time you run it, tell it the function is installed.
# This does not need to run every time, but it's harmless if it does.
# We'll just run it in the background.
zsh -c "broot --set-install-state installed > /dev/null &"
