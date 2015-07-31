#!/bin/bash 
# Author: Christian Gram Kalhauge (christian@kalhauge.dk)
# Date:   2015-05-31

STATE="VERBOSE"

# import files
source commands.sh

# Install configure files

# Vim 
register vimrc $HOME/.vimrc
github gmarik/Vundle.vim $HOME/.vim/bundle/vundle

# Zsh
register zshrc $HOME/.zshrc
github robbyrussell/oh-my-zsh $HOME/.oh-my-zsh

# Screen
register screenrc $HOME/.screenrc

# Tmux
register tmux.conf $HOME/.tmux.conf

# Termite
register termite.conf $HOME/.config/termite/config
