# Path to your oh-my-zsh configuration.

ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.themes
ZSH_THEME="kalhauge"

DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git archlinux vi-mode cabal chucknorris)
print "Starting OMZ"
source $ZSH/oh-my-zsh.sh

chuck_cow

## MY CHANGES

[ -f ~/.profile ] && source ~/.profile

bindkey -v

# Enable fasd
eval "$(fasd --init auto)"

texit() {
   pdflatex -draftmode $1.tex &&
   bibtex $1 &&
   pdflatex -draftmode $1.tex &&
   pdflatex $1.tex && open report.pdf
}

alias -s sh=/bin/bash

# Global helpers
alias -g myip=`echo $LOCAL_IP`

# Functions

unset GREP_OPTIONS

autoload -Uz promptinit
promptinit -i
if [[ $1 == eval ]]
then
   "$@"
   set --
fi


bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

export KEYTIMEOUT=1

