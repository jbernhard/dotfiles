"
" ~/.vim/ftplugin/cpp.vim
"

" half-indent scope declarations
" don't indent inside namespaces
setlocal cinoptions=g.5s,h.5s,N-s

let g:cmake_install_prefix = "~/.local"
let g:cmake_build_type = "Debug"
