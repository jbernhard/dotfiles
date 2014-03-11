"
" ~/.vim/ftplugin/markdown.vim
"

" indent blocks must be 4 spaces
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4

" run shortcut
noremap <F12> :w<CR>:!markdown '%' > '%:r.html'<CR>
