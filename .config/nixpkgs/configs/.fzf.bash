# Setup fzf
# ---------
if [[ ! "$PATH" == */home/starlord/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/starlord/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/starlord/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/starlord/.fzf/shell/key-bindings.bash"
