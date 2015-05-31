"" Vim esentials 
"" - Uses Vundle

"" Vundle {{{
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-surround'

"" Colours
Bundle 'nanotech/jellybeans.vim'

Bundle 'Lokaltog/vim-powerline'

Bundle 'scrooloose/syntastic'

"" Navigation
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'rking/ag.vim'

syntax on
filetype plugin indent on 
"" }}}

let mapleader=" "

color jellybeans
