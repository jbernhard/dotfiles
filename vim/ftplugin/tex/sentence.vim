"
" editing English sentences (tex, markdown, etc)
"

" spellcheck on by default
setlocal spell spelllang=en_us

" soft line wrap
setlocal wrap
setlocal linebreak
setlocal nolist
setlocal textwidth=0
setlocal wrapmargin=0

" fix keybindings
noremap <buffer> t gj
noremap <buffer> n gk
noremap <buffer> _ g^
noremap <buffer> - g$
noremap <buffer> D dg$
noremap <buffer> C cg$
noremap <buffer> Y yg$
