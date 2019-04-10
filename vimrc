"" Vim esentials 

"" Initial vim setup  {{{
setlocal foldmethod=marker

augroup VimReload
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
    autocmd BufWritePost *.vim source $MYVIMRC
augroup END
"" }}}

"" Plugins {{{
set nocompatible 

call plug#begin('~/.vim/plugged')

"" Plug 'gmarik/vundle'

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'

Plug 'jgdavey/tslime.vim'
Plug 'wellle/targets.vim'

Plug 'terryma/vim-expand-region'

Plug 'ervandew/supertab'

"" Crypto
Plug 'jamessan/vim-gnupg'

" Edit-scripts
Plug 'godlygeek/tabular'
Plug 'scrooloose/nerdcommenter'
Plug 'mattn/emmet-vim'

"" Colours
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'chriskempson/base16-vim'
Plug 'kalhauge/jellybeans.vim'
Plug '~/Develop/projects/2016/camelion.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'Lokaltog/vim-easymotion'
Plug 'Yggdroot/indentLine'

""" Snips
if !has('gui_running') 
    Plug 'SirVer/ultisnips'
    Plug 'Valloric/YouCompleteMe'
endif

Plug 'honza/vim-snippets'

""" Haskell
Plug 'Shougo/vimproc.vim', { 'for': 'haskell'}
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell'}
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell'}
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }

""" Syntax
if has('nvim') 
    Plug 'benekastah/neomake'
else
    Plug 'scrooloose/syntastic'
endif
Plug 'nfischer/vim-ohm'

Plug 'ElmCast/elm-vim'
let g:Haskell_no_mapping = 1
Plug 'digitaltoad/vim-jade'
Plug 'kchmck/vim-coffee-script', { 'for': 'coffeescript' }
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': 'markdown' }

Plug 'vim-pandoc/vim-pandoc'

Plug 'LnL7/vim-nix', {'for': 'nix'}

"" Navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim', { 'on': 'Ag' }
" Plug 'christoomey/vim-tmux-navigator'

call plug#end()

"" }}}

set t_Co=16
colorscheme camelion

""" Sane settings{{{

set expandtab
set tabstop=5
set shiftwidth=4
set synmaxcol=128
set nowrap
set ignorecase
set smartcase
set autoread

set relativenumber
set number
set noerrorbells
set nofoldenable
set encoding=utf-8

set complete=.,w,b,u,t,i

" Disable backup and swapfiles
set nobackup
set nowritebackup
set noswapfile

" set cryptmethod=blowfish2

set wildignore+=*.class,*.pyc

" Make spliting feel more naturaly
set splitbelow
set splitright

cnoremap w!! w ! sudo tee % > /dev/null

""" }}}

""" Leader Tree {{{
let mapleader=" "

"" Edit Vimrc
noremap <silent> <leader>ve :e $MYVIMRC<CR>
noremap <silent> <leader>vs :so $MYVIMRC<CR>
noremap <silent> <leader>vc :e $HOME/Develop/projects/2016/camelion.vim/colors/camelion.vim<CR>


"" Control and Config <leader>c
noremap <silent> <leader>r  :<UP><CR>
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
noremap <leader><leader> :nohlsearch<CR>
vnoremap <leader>sr "hy:%s/<C-r>h//gc<left><left><left>

"" Toggle <leader>t
noremap <silent> <leader>tn :NERDTreeToggle<CR>
noremap <silent> <leader>tw :set list!<CR>
noremap <silent> <leader>ts :set hlsearch! hlsearch?<CR>
noremap <silent> <leader>th :SyntasticToggleMode<CR>
noremap <silent> <leader>tc :NERDComToggleComment<CR>

"" Async <leader>a
noremap <silent> <leader>am :!tmux send-keys -t "2" 'make' Enter<CR><CR>
noremap <silent> <leader>ar :call SendToTmux("!-1\n\n")<CR><CR>

"" run
noremap <silent> <leader>rr :!./%<CR>

"" Buffers <leader>b
noremap <leader>bs :CtrlPBuffer<CR>
noremap <leader>bl :ls<CR>:b <Space>
noremap <leader>bd :bdelete<CR>

"" EASY motions: Line motions
nmap s <Plug>(easymotion-s)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

"" Copy paste
 noremap <leader>p "+p
vnoremap <leader>y "+y
noremap <silent> <leader> :let @+=@0<CR>

"" reformat notr
noremap <leader>nf :%!notr fmt<CR>

""" Language Specifics <leader>m {{{
if !exists("HaskellBindings")
    function! s:HaskellBindings () 
        noremap <leader>mt   :GhcModType<CR>
        noremap <leader>mc   :GhcModTypeClear<CR>
        noremap <leader>msf  :GhcModSplitFunCase<CR>
        noremap <leader>me   :GhcModExpand<CR>
    endfunction
    au BufRead *.hs call s:HaskellBindings()
endif

""" }}}
""" }}}

""" Sane navigations {{{
noremap <C-l> <C-w><C-l>
noremap <C-h> <C-w><C-h>
noremap <C-j> <C-w><C-j>
noremap <C-k> <C-w><C-k>

noremap <tab> <c-w>
noremap <tab><tab> <c-w><c-w>

" Enter command line mode
noremap <cr> :
" make Enter/CR work normally in quickfix and command-window
augroup enter_correctly
  au!
  au BufReadPost quickfix nnoremap <buffer> <cr> <cr>
  au CmdWinEnter * nnoremap <buffer> <cr> <cr>
augroup END
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

""" Plugs {{{

"" CtrlP
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard' ]

"" EasyMotion
let g:EasyMotion_do_mapping = 0

"" airline {{{
let g:airline_powerline_fonts = 1
let g:airline_theme = "solarized"
let g:airline_extensions = []
""" }}}

""" region expand {{{
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
""" }}}

"" Ultisnips {{{

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:UltiSnipsEditSplit="vertical"
""" }}}

"" Syntaxtic {{{
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute " ,"trimming empty <", "unescaped &" , "lacks \"action", "is not recognized!", "discarding unexpected"]

let g:syntastic_java_javac_config_file_enabled = 1
"" }}}

"" Pandoc {{{
"" let g:pandoc#command#latex_engine = 'pdflatex'
"" let g:pandoc#command#autoexec_on_writes = 1
"" let g:pandoc#command#autoexec_command = "Pandoc pdf"
"" }}}

"" vim2hs
let g:haskell_autotags = 1
let g:haskell_conceal_wide = 1

"" gnupg.vim
let g:GPGExecutable = "gpg2"

""" tslime {{{

let g:tslime_always_current_session = 1 
let g:tslime_always_current_window = 1

""" }}}

""" haskell-vim {{{
let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typeroles = 1
let g:haskell_enable_static_pointers = 1
""" }}}


""" }}}

""" Neo Vim {{{

if has('nvim')
    "" Hackaround
    nmap <BS> <C-W>h 
    autocmd! BufWritePost * Neomake
endif

""" }}}
" Vim
let g:indentLine_color_term = 14

let g:indentLine_color_tty_light = 14
let g:indentLine_color_dark = 5
let g:indentLine_char = '|'

let g:indentLine_enabled = 1

" -- let g:indentLine_concealcursor = "vc"
let g:indentLine_conceallevel = 0

" let g:indent_guides_auto_colors = 0 
" let g:indent_guides_start_level = 2
" let g:indent_guides_guide_size = 1
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=white ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4


""" Filetype specific {{{
autocmd Filetype html       setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype coffee     setlocal ts=2 sts=2 sw=2
autocmd Filetype jade       setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml       setlocal ts=2 sts=2 sw=2
autocmd Filetype haskell    setlocal ts=2 sts=2 sw=2
autocmd Filetype elm        setlocal ts=2 sts=2 sw=2
autocmd Filetype markdown   setlocal tw=72 
autocmd Filetype markdown   setlocal tw=72 
autocmd Filetype pandoc     setlocal tw=72 fo+=toqn
""" }}}
