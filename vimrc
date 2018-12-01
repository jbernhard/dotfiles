"
" ~/.vimrc
"

" neo/vim specific
if has('nvim')
  " make nvim use ~/.vim
  set runtimepath^=~/.vim runtimepath+=~/.vim/after
  let &packpath = &runtimepath
else
  " change terminal cursor shape depending on mode
  let &t_SI = "\e[6 q"
  let &t_SR = "\e[4 q"
  let &t_EI = "\e[2 q"

  " terminal undercurl
  let &t_Cs = "\e[4:3m"
  let &t_Ce = "\e[4:0m"

  " put all swap files in a central location
  set directory^=$HOME/.vim/tmp//
  set backupdir^=$HOME/.vim/tmp//
endif

" plugins
call plug#begin('~/.vim/plugged')

Plug 'icymind/NeoSolarized'
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'nvie/vim-flake8'
Plug 'hynek/vim-python-pep8-indent'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'ntpeters/vim-better-whitespace'
Plug 'mitsuhiko/vim-jinja'
Plug 'mattn/emmet-vim'
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

" general
set termguicolors
set number
set textwidth=80
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set cindent
set smarttab
set showtabline=2
set laststatus=1
set hlsearch
set incsearch
set wildmode=list:longest,full
set backspace=indent,eol,start
set nostartofline
set ignorecase
set smartcase
set mouse=a
set ttimeout
set ttimeoutlen=100
set scrolloff=3
set sidescrolloff=5
set updatetime=100

" prefer vertical split
set splitright
set splitbelow

" extended matching
runtime! macros/matchit.vim

" solarized colors
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 1
colorscheme NeoSolarized
set background=dark

" link tab bar highlighting to main window
highlight! link TabLineFill Normal

" match gitgutter bg color to line number column
let s:guibg = synIDattr(hlID('LineNr'), 'bg', 'gui')
let s:ctermbg = synIDattr(hlID('LineNr'), 'bg', 'cterm')

for group in ['Add', 'Change', 'Delete', 'ChangeDelete']
  execute 'highlight GitGutter' . group . ' guibg=' . s:guibg . ' ctermbg=' . s:ctermbg
endfor

" gui options
if has('gui_running')
  set guifont=monospace\ 13

  " remove clutter
  set guioptions-=m   " menubar
  set guioptions-=T   " toolbar
  set guioptions-=r   " right scrollbar
  set guioptions-=L   " left scrollbar

  " disable cursor blink
  set guicursor=a:blinkon0

  " disable alt-key access to menus
  set winaltkeys=no
endif

" save and load views automatically for appropriate files
" (systemd-tmpfiles is configured to clean old view files)
function UseView()
  let l:fname = expand('%:p')
  return &modifiable
        \ && filewritable(l:fname)
        \ && &buftype == ''
        \ && !&l:diff
        \ && &filetype != 'gitcommit'
        \ && l:fname !~ '^\(fugitive://\|/run\|/tmp\)'
endfunction

autocmd BufWinLeave * if UseView() | mkview | endif
autocmd BufWinEnter * if UseView() | silent! loadview | endif

" youcompleteme settings
let g:ycm_always_populate_location_list = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" change default UltiSnips trigger keys for compatibility with ycm
let g:UltiSnipsExpandTrigger = "<C-s>"
let g:UltiSnipsListSnippets = "<C-l>"
let g:UltiSnipsJumpForwardTrigger = "<C-t>"
let g:UltiSnipsJumpBackwardTrigger = "<C-n>"

" prevent detecting some tex files as 'plaintex'
let g:tex_flavor='latex'

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
map <F9> :setlocal spell! spelllang=en_us<CR>

" make shortcut
map <Leader>m :update<CR>:make<CR>

" :W = :w
cmap W<CR> w<CR>

" tabs
map <A-h> :tabprevious<CR>
map <A-s> :tabnext<CR>
map <A-t> :tabmove -<CR>
map <A-n> :tabmove +<CR>

" quickly turn of highlighting
map <C-h> :nohlsearch<CR>

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
