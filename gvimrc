"
" ~/.gvimrc
"

if hostname() == "river"
  set guifont=DejaVu\ Sans\ Mono\ 9
elseif hostname() == "ice9"
  set guifont=DejaVu\ Sans\ Mono\ 10
elseif hostname() == "serenity"
  set guifont=DejaVu\ Sans\ Mono\ 13
endif

set guicursor=a:blinkon0

set winaltkeys=no
