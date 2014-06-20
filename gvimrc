"
" ~/.gvimrc
"

" gui color scheme
colorscheme solarized

" light/dark depending on day/night
let hour = strftime('%H')
if hour > 6 && hour < 20
  set background=light
else
  set background=dark
endif

" set font size according to hostname
execute 'set guifont=DejaVu\ Sans\ Mono\ ' . get({'river': 9, 'ice9': 10, 'serenity': 13}, hostname(), 10)

" remove gui clutter
set guioptions-=m   " menubar
set guioptions-=T   " toolbar
set guioptions-=r   " right scrollbar
set guioptions-=L   " left scrollbar

" disable cursor blink
set guicursor=a:blinkon0

" disable alt-key access to menus
set winaltkeys=no
