"
" ~/.vim/ftplugin/markdown.vim
"

" run shortcut
"noremap <buffer> <F12> :w<CR>:!markdown '%' > '%:r.html'<CR>
setlocal makeprg=markdown\ %\ >\ ~/tmp/%:r.html
