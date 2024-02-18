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

alias nnn='nnn -de'

alias lg='lazygit'

alias pf='pfetch'

# --- #
# env #
# --- #

export PATH=/home/april/.local/bin:$PATH

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

export HISTFILE=~/.history
export HISTSIZE=5000

export VISUAL=nvim
export EDITOR="$VISUAL"

# nnn
export NNN_TRASH=1
export NNN_OPTS="" # 'H' shows the hidden files. Same as option -H (so 'nnn -deH')
# export NNN_OPTS="deH" # if you prefer to have all the options at the same place
export LC_COLLATE="C" # hidden files on top
export NNN_FIFO="/tmp/nnn.fifo" # temporary buffer for the previews
export NNN_FCOLORS="AAAAE631BBBBCCCCDDDD9999" # feel free to change the colors
export NNN_PLUG='p:preview-tui' # many other plugins are available here: https://github.com/jarun/nnn/tree/master/plugins
export SPLIT='v' # to split Kitty vertically

# -------- #
# keybinds #
# -------- #

bind '"\C-H": backward-kill-word'
bind '"\e[3;5~": kill-word'

# fzf shortcuts
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

# ------- #
# startup #
# ------- #

# display system info on startup 
pfetch

# initialize starship prompt
eval "$(starship init bash)"
