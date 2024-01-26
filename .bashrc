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
alias ll='ls -l --color=auto'
alias l='ls -lta --color=auto'

alias ncmpcpp='ncmpcpp -b ~/.config/ncmpcpp/bindings'

alias nv='nvim'
alias lv='lvim'

alias lg='lazygit'

alias pf='pfetch'

# --- #
# env #
# --- #

export VISUAL=nvim
export EDITOR="$VISUAL"

# ------- #
# startup #
# ------- #

# display system info on startup 
pfetch

# initialize starship prompt
eval "$(starship init bash)"
