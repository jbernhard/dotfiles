"
" ~/.vimrc
"

" plugins
call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'Valloric/YouCompleteMe'
Plug 'Valloric/ListToggle'
Plug 'tpope/vim-fugitive'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'nvie/vim-flake8'
Plug 'hynek/vim-python-pep8-indent'
Plug 'scrooloose/nerdcommenter'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'ntpeters/vim-better-whitespace'
Plug 'mitsuhiko/vim-jinja'
Plug 'mattn/emmet-vim'
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

" general
set number
set textwidth=80
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set cindent
set smarttab
set showtabline=2
set viminfo='100,f1
set hlsearch
set incsearch
set wildmode=list:longest,full
set backspace=indent,eol,start
set nostartofline
set ignorecase
set smartcase
set ttymouse=xterm2
set mouse=a
set ttimeout
set ttimeoutlen=100
set scrolloff=1
set sidescrolloff=5
"set completeopt=longest,menuone

" prefer vertical split
set splitright
set splitbelow

" put all swap files in a central location
set directory^=$HOME/.vim/tmp//
set backupdir^=$HOME/.vim/tmp//

" extended matching
runtime! macros/matchit.vim

" solarized dark colors
colorscheme solarized
set background=dark

" gui/terminal-specific
if has('gui_running')
  set guifont=monospace\ 13

  " shortcut to toggle light/dark solarized
  call togglebg#map("<F4>")

  " remove gui clutter
  set guioptions-=m   " menubar
  set guioptions-=T   " toolbar
  set guioptions-=r   " right scrollbar
  set guioptions-=L   " left scrollbar

  " disable cursor blink
  set guicursor=a:blinkon0

  " disable alt-key access to menus
  set winaltkeys=no
endif

" save views automatically
" enable clear-old-files.service systemd user service to automatically clean old view files
autocmd BufWinLeave * if expand('%') != '' && expand('%') !~ '^fugitive' && &ft != 'gitcommit' | mkview | endif
autocmd BufWinEnter * if expand('%') != '' && expand('%') !~ '^fugitive' && &ft != 'gitcommit' | loadview | endif

" markdown file extension
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" youcompleteme settings
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
let g:ycm_always_populate_location_list = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" change default UltiSnips trigger keys for compatibility with ycm
let g:UltiSnipsExpandTrigger = "<C-Enter>"
let g:UltiSnipsListSnippets = "<C-S-Enter>"
let g:UltiSnipsJumpForwardTrigger = "<C-Space>"
let g:UltiSnipsJumpBackwardTrigger = "<C-S-Space>"

" prevent vim from detecting some tex files as 'plaintex'
let g:tex_flavor='latex'

" gist settings
let g:gist_clip_command = 'xsel --clipboard'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_show_privates = 1
let g:gist_post_private = 1
let g:gist_update_on_write = 2

" nerd commenter
let g:NERDSpaceDelims = 1

" whitespace
let g:better_whitespace_filetypes_blacklist = ['gitcommit']

"
" keyboard
"

" redefine leader
let mapleader = ","

" should be the default
map Y y$

" spellcheck toggle
map <F11> :setlocal spell! spelllang=en_us<CR>

" make shortcut
map <Leader>m :update<CR>:make<CR>

" taglist
map <Leader>t :TlistToggle<CR>

" :W = :w
cmap W<CR> w<CR>

" tabs
map <C-Tab> :tabn<CR>
map <C-S-Tab> :tabp<CR>
imap <C-Tab> <Esc>:tabn<CR>
imap <C-S-Tab> <Esc>:tabp<CR>

" quickly turn of highlighting
map <C-H> :noh<CR>

" locally change to directory of current file
command Cd lcd %:p:h

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
