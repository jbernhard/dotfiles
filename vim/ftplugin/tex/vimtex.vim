"
" vimtex settings
"

" use okular as viewer
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'

" alt-c is easier to press than F7
nmap <silent><buffer> <A-c> <plug>(vimtex-cmd-create)
xmap <silent><buffer> <A-c> <plug>(vimtex-cmd-create)
imap <silent><buffer> <A-c> <plug>(vimtex-cmd-create)

" change default toggle commands because the t prefix interferes with dvorak movement
" replace t -> j since j was the original movement key
nmap <silent><buffer> jsc <plug>(vimtex-cmd-toggle-star)
nmap <silent><buffer> jse <plug>(vimtex-env-toggle-star)
nmap <silent><buffer> jsd <plug>(vimtex-delim-toggle-modifier)
xmap <silent><buffer> jsd <plug>(vimtex-delim-toggle-modifier)
nmap <silent><buffer> jsD <plug>(vimtex-delim-toggle-modifier-reverse)
xmap <silent><buffer> jsD <plug>(vimtex-delim-toggle-modifier-reverse)
