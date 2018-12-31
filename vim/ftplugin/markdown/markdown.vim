"
" markdown
"

" run shortcut
setlocal makeprg=markdown\ %\ >\ ~/tmp/%:r.html

" vim-markdown plugin settings
let g:vim_markdown_new_list_item_indent = 2
set conceallevel=2
