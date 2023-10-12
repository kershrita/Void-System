# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -l'
alias clc='clear'

PS1='[\u@\h \W]\$ '

# xbps
alias i='sudo xbps-install -S'
alias u='install; sudo xbps-install -u xbps; sudo xbps-install -u'
alias q='sudo xbps-query -Rs'
alias r='sudo xbps-remove -R'

# vim to vi
alias vi='vim'
