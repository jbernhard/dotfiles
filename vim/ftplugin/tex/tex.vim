"
" latex-suite
"

" needed for completion
setlocal grepprg=grep\ -nH\ $*

" <C-n> to autocomplete \ref{xxx: commands
setlocal iskeyword+=:

" compile to pdf
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_pdf	= 'make'

" view in okular
let g:Tex_ViewRule_pdf = 'okular'
noremap <buffer> <F10> :call Tex_ForwardSearchLaTeX()<CR>
noremap <buffer> <S-F10> :call Tex_ViewLaTeX()<CR>

" texcount shortcut
noremap <buffer> <F9> :w<CR>:!texcount %<CR>

" new jump shortcut
nmap <buffer> <C-space> <Plug>IMAP_JumpForward
vmap <buffer> <C-space> <Plug>IMAP_JumpForward
imap <buffer> <C-space> <Plug>IMAP_JumpForward

" shortcuts for \bigl( .. \bigr), etc
call IMAP('big(', '\bigl( <++> \bigr) <++>', 'tex')
call IMAP('Big(', '\Bigl( <++> \Bigr) <++>', 'tex')
call IMAP('bigg(', '\biggl( <++> \biggr) <++>', 'tex')
call IMAP('Bigg(', '\Biggl( <++> \Biggr) <++>', 'tex')
call IMAP('big[', '\bigl[ <++> \bigr] <++>', 'tex')
call IMAP('Big[', '\Bigl[ <++> \Bigr] <++>', 'tex')
call IMAP('bigg[', '\biggl[ <++> \biggr] <++>', 'tex')
call IMAP('Bigg[', '\Biggl[ <++> \Biggr] <++>', 'tex')
call IMAP('big{', '\bigl\{ <++> \bigr\} <++>', 'tex')
call IMAP('Big{', '\Bigl\{ <++> \Bigr\} <++>', 'tex')
call IMAP('bigg{', '\biggl\{ <++> \biggr\} <++>', 'tex')
call IMAP('Bigg{', '\Biggl\{ <++> \Biggr\} <++>', 'tex')
call IMAP('big|', '\bigl| <++> \bigr| <++>', 'tex')
call IMAP('Big|', '\Bigl| <++> \Bigr| <++>', 'tex')
call IMAP('bigg|', '\biggl| <++> \biggr| <++>', 'tex')
call IMAP('Bigg|', '\Biggl| <++> \Biggr| <++>', 'tex')

" don't autofold
let g:Tex_AutoFolding = 0

" various settings
let g:Tex_FoldedEnvironments = 'abstract,frame'
let g:Tex_FoldedSections = 'part,chapter,section,subsection,subsubsection'
let g:Tex_FoldedMisc = '<<<'
let g:Tex_PromptedEnvironments = 'equation*,align*,equation,align,pmatrix,bmatrix,tabular,columns'
let g:Tex_HotKeyMappings = 'equation*,align*,equation,align'
let g:Tex_Env_center = "\\begin{center}\<CR><++>\<CR>\\end{center}"
let g:Tex_Env_equation = "\\begin{equation}\<CR><++>\<CR>\\end{equation}"
let g:Tex_Env_align = "\\begin{align}\<CR><++>\<CR>\\end{align}"
let g:Tex_Env_pmatrix = "\\begin{pmatrix}\<CR><++>\<CR>\\end{pmatrix}"
let g:Tex_Env_bmatrix = "\\begin{bmatrix}\<CR><++>\<CR>\\end{bmatrix}"
let g:Tex_Env_displaymath = "\\begin{equation*}\<CR><++>\<CR>\\end{equation*}"
let g:Tex_Env_tabular = "\\begin{tabular}{<++>}\<CR>\\toprule\<CR><++>\<CR>\\midrule\<CR>\\bottomrule\<CR>\\end{tabular}"
let g:Tex_Env_figure = "\\begin{figure}\<CR>\\centering\<CR>\\includegraphics{<++>}\<CR>\\end{figure}"
let g:Tex_Env_frame = "\\begin{frame}{<++>}\<CR><++>\<CR>\\end{frame}"
let g:Tex_Env_block = "\\begin{block}{<++>}\<CR><++>\<CR>\\end{block}"
let g:Tex_Env_columns = "\\begin{columns}\<CR>\\column{<++>}\<CR><++>\<CR>\\end{columns}"

let g:Tex_Env_itemize = "\\begin{itemize}\<CR>\\item <++>\<CR>\\end{itemize}"
let g:Tex_Env_enumerate = "\\begin{enumerate}\<CR>\\item <++>\<CR>\\end{enumerate}"

let g:Tex_PromptedCommands = 'ref,cite,label,includegraphics,textsuperscript'
let g:Tex_IgnoredWarnings =
\"Underfull\n".
\"Overfull\n".
\"specifier changed to\n".
\"You have requested\n".
\"Missing number, treated as zero.\n".
\"There were undefined references\n".
\"Citation %.%# undefined\n".
\"Font Warning"
let g:Tex_IgnoreLevel = 8
