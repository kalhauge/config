#!/usr/bin/env bash 
# Author: Christian Gram Kalhauge (christian@kalhauge.dk)
# Date:   2015-05-31

#STATE="VERBOSE"

# import files
source commands.sh

# Install configure files
CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
DATA_HOME=${XDG_DATA_HOME:-$HOME/.config}

# Vim 
register vimrc $HOME/.vimrc
get https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim $HOME/.vim/autoload/plug.vim

# Neo Vim 
register vimrc $HOME/.nvimrc
ln -s $HOME/.vim $HOME/.nvim

# Zsh
register zsh/zshrc $HOME/.zshrc

ZSH_HOME=$HOME/.oh-my-zsh
github robbyrussell/oh-my-zsh $ZSH_HOME

ZSH_CUSTOM=$ZSH_HOME/custom
github spwhitt/nix-zsh-completions $ZSH_CUSTOM/plugins/nix
register_all zsh/themes $ZSH_CUSTOM

# Spacemacs
register spacemacs $HOME/.spacemacs

# stack 
register stack.yaml $HOME/.stack/config.yaml

# Screen
register screenrc $HOME/.screenrc

# Tmux
register tmux.conf $HOME/.tmux.conf

# Termite
register termite.conf $CONFIG_HOME/termite/config

# X11
register xconfigs/xprofile.sh $HOME/.xprofile

# NixOS
mkdir -p $HOME/.nixpkgs
register nixpkgs.nix $HOME/.nixpkgs/config.nix
