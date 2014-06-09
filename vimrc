"
" ~/.vimrc
"


" iMproved
set nocompatible

" vundle
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'taglist.vim'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-fugitive'
Plugin 'twerth/ir_black'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'nvie/vim-flake8'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'davidhalter/jedi-vim'

call vundle#end()


" general 
filetype plugin indent on
syntax on
colorscheme ir_black
set number
set textwidth=140
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set cindent
set smarttab
set showtabline=2
set viminfo='100,f1
set hlsearch
set wildmode=list:longest,full
set wildignore=*.log,*.aux,*.dvi,*.aut,*.aux,*.bbl,*.blg,*.dvi,*.end,*.fff,*.log,*.out,*.pdf,*.ps,*.toc,*.ttt,*.synctex.gz,*.table,*.gnuplot,*.snm,*.nav,*.nb
set autochdir
set backspace=indent,eol,start
set nostartofline
set ignorecase
set smartcase
set ttymouse=xterm2
set mouse=a

" put all swap files in a central location
set directory^=$HOME/.vim/tmp//
set backupdir^=$HOME/.vim/tmp//

" prefer vertical split
set splitright
set splitbelow

" save views automatically
" suggest a cron job to run e.g.
" find $HOME/.vim/view -type f -mtime +7 -delete
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" omni completion
"set omnifunc=syntaxcomplete#Complete

" ensure latex-suite is loaded
let g:tex_flavor='latex'

" gist settings
let g:gist_clip_command = 'xsel --clipboard'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_show_privates = 1
let g:gist_post_private = 1
let g:gist_update_on_write = 2


"
" keyboard
" 

" should be the default
map Y y$

" spellcheck toggle
map <F11> :setlocal spell! spelllang=en_us<CR>

" :W = :w
cmap W<CR> w<CR>

" tabs
map <C-Tab> :tabn<CR>
map <C-S-Tab> :tabp<CR>
imap <C-Tab> <Esc>:tabn<CR>
imap <C-S-Tab> <Esc>:tabp<CR>

" quickly turn of highlighting
map <C-H> :noh<CR>

" dvorak
"noremap h h
"noremap H H
noremap t j
noremap n k
noremap s l
noremap S L
noremap <C-W>h <C-W>h
noremap <C-W>H <C-W>H
noremap <C-W>t <C-W>j
noremap <C-W>T <C-W>J
noremap <C-W>n <C-W>k
noremap <C-W>N <C-W>K
noremap <C-W>s <C-W>l
noremap <C-W>S <C-W>L
" fixes
noremap k t
noremap K T
noremap l n
noremap L N
noremap <C-W>k <C-W>t
noremap <C-W>K <C-W>T
noremap <C-W>l <C-W>n
noremap <C-W>L <C-W>N
noremap T L
" other helpful things
noremap - $
noremap _ ^
