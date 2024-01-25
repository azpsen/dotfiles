# --------- #
# ~/.bashrc #
# --------- #

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# ------- #
# aliases #
# ------- #

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias ncmpcpp='ncmpcpp -b ~/.config/ncmpcpp/bindings'

# --- #
# env #
# --- #

export VISUAL=nvim
export EDITOR="$VISUAL"

# ------- #
# startup #
# ------- #

# restore color scheme
(cat ~/.cache/wal/sequences &)

# display system info on startup 
pfetch

# initialize starship prompt
eval "$(starship init bash)"
