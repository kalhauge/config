#!/bin/bash 
# Author: Christian Gram Kalhauge (christian@kalhauge.dk)
# Date:   2015-05-31

STATE=""

# import files
source commands.sh

# Install configure files

# Vim 
register vimrc $HOME/.vimrc
github gmarik/Vundle.vim $HOME/.vim/bundle/vundle

# Zsh
register zshrc $HOME/.zshrc

# Screen
register screenrc $HOME/.screenrc
