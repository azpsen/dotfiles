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

# ------- #
# startup #
# ------- #

# display system info on startup 
pfetch

# initialize starship prompt
eval "$(starship init bash)"
