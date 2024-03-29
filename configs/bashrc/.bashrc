# 
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias pac='sudo pacman -Syu'

BLACK="\[\e[30m\]"
BLUE="\[\e[34m\]"
CYAN="\[\e[36m\]"
GREEN="\[\e[32m\]"
MAGENTA="\[\e[35m\]"
RED="\[\e[31m\]"
WHITE="\[\e[37m\]"
YELLOW="\[\e[33m\]"

cat ~/.cache/wal/sequences

PS1="${CYAN}\W ${GREEN}${WHITE} "