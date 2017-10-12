"
" vimtex settings
"

" use okular as viewer
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'

" change default toggle commands because the t prefix interferes with dvorak movement
" replace t -> j since j was the original movement key
nmap <silent><buffer> jsc <plug>(vimtex-cmd-toggle-star)
nmap <silent><buffer> jse <plug>(vimtex-env-toggle-star)
nmap <silent><buffer> jsd <plug>(vimtex-delim-toggle-modifier)
xmap <silent><buffer> jsd <plug>(vimtex-delim-toggle-modifier)
nmap <silent><buffer> jsD <plug>(vimtex-delim-toggle-modifier-reverse)
xmap <silent><buffer> jsD <plug>(vimtex-delim-toggle-modifier-reverse)
