# Setup fzf
# ---------

# Will assume fzf is already in the path
# if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
#   export PATH="$PATH:/usr/local/opt/fzf/bin"
# fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
if [ -f "/usr/local/opt/fzf/shell/key-bindings.bash" ]
then
    source "/usr/local/opt/fzf/shell/key-bindings.bash"
fi
