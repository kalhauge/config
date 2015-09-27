"" Vim esentials 
"" - Uses Vundle

"" Vundle {{{
set nocompatible 
filetype off 
set rtp+=~/.vim/bundle/vundle/
call vundle#rc() 
Plugin 'gmarik/vundle'

Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'

Plugin 'jamessan/vim-gnupg'

"" Edit-scripts
Plugin 'godlygeek/tabular'
Plugin 'mattn/emmet-vim'

"" Colours
Plugin 'kalhauge/jellybeans.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'Lokaltog/vim-easymotion'

""" Snips
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

""" Syntax
Plugin 'scrooloose/syntastic'
Plugin 'digitaltoad/vim-jade'
Plugin 'kchmck/vim-coffee-script'
Plugin 'dag/vim2hs'

"" Navigation
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'

syntax on
filetype plugin indent on 
"" }}}

let mapleader=" "

"" jellybeans
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
set autoread

set noerrorbells

" Disable backup and swapfiles
set nobackup
set nowritebackup
set noswapfile

set cryptmethod=blowfish2

set wildignore+=*.class,*.pyc

" Make spliting feel more naturaly
set splitbelow
set splitright

cnoremap w!! w ! sudo tee % > /dev/null

""" }}}

""" Leader Tree {{{

"" Edit Vimrc
noremap <silent> <leader>ve :e $MYVIMRC<CR>
noremap <silent> <leader>vs :so $MYVIMRC<CR>

"" Control and Config <leader>c
noremap <silent> <leader>cr :redraw!<CR>
noremap <silent> <leader>cu :UltiSnipsEdit<CR>

"" Format <leader>f
noremap <leader>fef ggVG=

nnoremap <leader>fa= :Tabularize /=<CR>
vnoremap <leader>fa= :Tabularize /=<CR>
nnoremap <leader>fa: :Tabularize /:\zs<CR>
vnoremap <leader>fa: :Tabularize /:\zs<CR>
nnoremap <leader>fa<space> :Tabularize / <CR>
vnoremap <leader>fa<space> :Tabularize / <CR>
vnoremap <leader>fa :Tabularize /
nnoremap <leader>fa :Tabularize /

nnoremap <leader>K f<space>r<cr>
nnoremap K g_F<Space><Space>i<CR><Esc>k

"" Fugitive <leader>g
noremap <leader>gw :Gwrite<CR>
noremap <leader>gb :Gblame<CR>
noremap <leader>gm :Gmove<CR>

noremap <leader>ge :Gedit 
noremap <leader>gve :Gvsplit 
noremap <leader>gse :Gsplit 

noremap <leader>gvd :Gvdiff<CR>
noremap <leader>gd  :Gdiff<CR>
noremap <leader>gsd :Gsdiff<CR>

noremap <leader>gg :Git 
noremap <leader>gG :Git! 

noremap <leader>gst :Gstatus<CR>
noremap <leader>gc :Gcommit<CR>

"" Search <leader>s
noremap <leader>sa :Ag ""<Left>
noremap <leader>sg :Ggrep ""<Left>
noremap <leader>ss :nohlsearch<CR> 
vnoremap <leader>sr "hy:%s/<C-r>h//gc<left><left><left>

"" Toggle <leader>t
noremap <silent> <leader>tn :NERDTreeToggle<CR>
noremap <silent> <leader>tw :set list!<CR>

"" Buffers <leader>b
noremap <leader>bs :CtrlPBuffer<CR>
noremap <leader>bl :ls<CR>:b <Space>

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

"" Syntaxtic

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute " ,"trimming empty <", "unescaped &" , "lacks \"action", "is not recognized!", "discarding unexpected"]

let g:syntastic_java_javac_config_file_enabled = 1

"" vim2hs

let g:haskell_autotags = 1
let g:haskell_conceal_wide = 1

"" gnupg.vim

let g:GPGExecutable = "gpg2"

""" }}}


""" {{{
autocmd Filetype html       setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype coffee     setlocal ts=2 sts=2 sw=2
autocmd Filetype jade       setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml       setlocal ts=2 sts=2 sw=2
autocmd Filetype haskell    setlocal ts=2 sts=2 sw=2
autocmd Filetype markdown   setlocal tw=72 
""" }}}
