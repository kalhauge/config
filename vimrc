"" Vim esentials 
"" - Uses Vundle

"" Vundle {{{
set nocompatible 
filetype off 
set rtp+=~/.vim/bundle/vundle/
call vundle#rc() 
Plugin 'gmarik/vundle'

Plugin 'tpope/vim-sensible'

""
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'

"" Colours
Plugin 'nanotech/jellybeans.vim'

Plugin 'Lokaltog/vim-powerline'
Plugin 'Lokaltog/vim-easymotion'

""" Snips
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'


""" Syntax
Plugin 'scrooloose/syntastic'
Plugin 'digitaltoad/vim-jade'
Plugin 'kchmck/vim-coffee-script'

"" Navigation
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'

syntax on
filetype plugin indent on 
"" }}}

let mapleader=" "

color jellybeans

""" Sane settings{{{

set expandtab
set tabstop=4
set shiftwidth=4
set synmaxcol=128
set nowrap
set hlsearch
set ignorecase
set smartcase

set noerrorbells

" Disable backup and swapfiles
set nobackup
set nowritebackup
set noswapfile

set wildignore+=*/.git/*,*.class,*.pyc

" Make spliting feel more naturaly
set splitbelow
set splitright

""" }}}

""" Leader Tree {{{

"" Control and Config <leader>c
noremap <silent> <leader>cr :redraw!<CR>
noremap <silent> <leader>cu :UltiSnipsEdit<CR>

"" Format <leader>f
noremap <leader>fef ggVG=

nnoremap <leader>fa= :Tabularize /=<CR>
vnoremap <leader>fa= :Tabularize /=<CR>
nnoremap <leader>fa: :Tabularize /:\zs<CR>
vnoremap <leader>fa: :Tabularize /:\zs<CR>

"" Search <leader>s
noremap <leader>sa :Ag ""<Left>
vnoremap <leader>sr "hy:%s/<C-r>h//gc<left><left><left>

"" Toggle <leader>t
noremap <silent> <leader>tn :NERDTreeToggle<CR>
noremap <silent> <leader>tw :set list!<CR>

"" Buffers <leader>b
noremap <leader>bs :CtrlPBuffer<CR>

" EASY motions: Line motions
nmap s <Plug>(easymotion-s2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

"" Copy paste
 noremap <leader>p "+p
vnoremap <leader>y "+y

""" }}}

""" Sane navigations {{{
noremap <C-l> <C-w><C-l>
noremap <C-h> <C-w><C-h>
noremap <C-j> <C-w><C-j>
noremap <C-k> <C-w><C-k>
""" }}}

""" Emacs mappings {{{
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>
""" }}}

""" Plugins {{{

""" CtrlP
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard' ]

"" EasyMotion

let g:EasyMotion_do_mapping = 0

"" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:UltiSnipsEditSplit="vertical"

""" }}}



