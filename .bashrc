#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

EDITOR="/usr/bin/vim"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ..='cd ..'
alias print='ls -la'
alias vi='nvim'
alias vim='nvim'

# PS1='[\u@\h \W]\$ '
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n=> '

export LC_ALL=en_US.UTF-8

# rust
source "$HOME/.cargo/env"

fish
