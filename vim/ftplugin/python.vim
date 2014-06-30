"
" ~/.vim/ftplugin/python.vim
"

" PEP 8 formatting
setlocal textwidth=79
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal shiftround
setlocal autoindent

" folding
setlocal foldmethod=indent
setlocal foldlevel=99

" run shortcut
"noremap <buffer> <F12> :w<CR>:!./'%'<CR>
setlocal makeprg=./%
