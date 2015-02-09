"
" restructured text
"

" indent width
setlocal softtabstop=3
setlocal shiftwidth=3

" run shortcut
setlocal makeprg=rst2html\ %\ >\ ~/tmp/%:r.html
