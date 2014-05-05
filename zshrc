#!/usr/bin/env zsh
#   _________  _   _ ____   ____ 
#  |__  / ___|| | | |  _ \ / ___|
#    / /\___ \| |_| | |_) | |    
# _ / /_ ___) |  _  |  _ <| |___ 
#(_)____|____/|_| |_|_| \_\\____|
# source : http://doc.ubuntu-fr.org/zsh
 
# Complétion 
autoload -U compinit
compinit
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                             /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
# Crée un cache des complétion possibles
# très utile pour les complétion qui demandent beaucoup de temps
# comme la recherche d'un paquet aptitude install moz<tab>
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh_cache
# des couleurs pour la complétion
# faites un kill -9 <tab><tab> pour voir :)
zmodload zsh/complist
setopt extendedglob
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"
 
# Correction des commandes
#setopt correctall
 
# Un petit prompt sympa
autoload -U promptinit
promptinit
prompt adam2
 
# Les alias marchent comme sous bash
alias ls='ls --color=auto'
alias ll='ls --color=auto -lh'
alias lll='ls --color=auto -lh | less'
# marre de se faire corriger par zsh ;)
alias xs='cd'
alias sl='ls'
# mplayer en plein framme buffer ;)
alias mplayerfb='mplayer -vo fbdev -vf scale=1024:768'
# Un grep avec des couleurs :
export GREP_COLOR=31
alias grep='grep --color=auto'
alias xte='nohup xterm &' # xte lancera un xterm qui ne se fermera pas si on ferme le terminal
# Pareil pour les variables d'environement :
#export http_proxy="http://hostname:8080/"
#export HTTP_PROXY=$http_proxy
# un VRAI éditeur de texte ;)
export EDITOR=/usr/bin/vim


#####
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# source: http://askubuntu.com/questions/31216/setting-up-aliases-in-zsh
# I go back and forth between bash and zsh, and use the same .aliases file for both.
# They share the same basic alias syntax, so you can create a .aliases file and link it to .bashrc and .zshrc:

source $HOME/.aliases

# PATH=$HOME/.gem/ruby/1.9.1/bin:$HOME/bin:$PATH
 
# GEM_HOME=$HOME/.gem/ruby/1.9.1
# GEM_PATH=$HOME/.gem:/usr/lib/ruby/gems/1.9.1
# export PATH GEM_HOME GEM_PATH
# export PATH=$PATH:/home/maxlath/.gem/ruby/1.9.1/bin
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
source $HOME/.rvm/scripts/rvm

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

setopt BRACE_CCL # source: http://stackoverflow.com/questions/2394728/zsh-brace-expansion-seq-for-character-lists-how

export MAILCHIMP_KEY_ID=55c2899ec9189665ff2b7cce4692dd69-us3