"
" ~/.vim/ftplugin/tex.vim
"


" spellcheck on by default
setlocal spell spelllang=en_us


"
" latex-suite settings
"

" needed for completion
setlocal grepprg=grep\ -nH\ $*

" <C-n> to autocomplete \ref{xxx: commands
setlocal iskeyword+=:

" compile to pdf
let g:Tex_UseEditorSettingInDVIViewer = 1
let g:Tex_DefaultTargetFormat = 'pdf'

" view in okular
let g:Tex_ViewRule_dvi = 'okular'
let g:Tex_ViewRule_ps = 'okular'
let g:Tex_ViewRule_pdf = 'okular'

" uncomment these for dvi > ps > pdf
"let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
"let g:Tex_CompileRule_dvi	= 'latex -interaction nonstopmode -synctex=1 $*'
"let g:Tex_CompileRule_ps = 'dvips $*.dvi'
"let g:Tex_CompileRule_pdf = 'ps2pdf $*.ps'

" uncomment these for pdflatex
let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_CompileRule_pdf	= 'pdflatex -interaction nonstopmode -synctex=1 -shell-escape $*'

" compile & view shortcuts
"no <F12> :w<CR>:call Tex_RunLaTeX()<CR>
noremap <F12> :w<CR>:!compilelatex.sh '%:r'<CR>
noremap <F10> :call Tex_ForwardSearchLaTeX()<CR>
noremap <S-F10> :call Tex_ViewLaTeX()<CR>

" texcount shortcut
noremap <F9> :w<CR>:!texcount %<CR>

" new jump shortcut
nmap <C-space> <Plug>IMAP_JumpForward
vmap <C-space> <Plug>IMAP_JumpForward
imap <C-space> <Plug>IMAP_JumpForward

" new refresh folds shortcut
nmap <C-S-F> <Plug>Tex_RefreshFolds
vmap <C-S-F> <Plug>Tex_RefreshFolds
imap <C-S-F> <Plug>Tex_RefreshFolds

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

" other shortcuts
function! Tex_Unit()
  return IMAP_PutTextWithMovement('\unit{<++>}<++>')
endfunction

"imap <M-u> <Plug>Tex_Unit
"call Tex_MakeMap('<M-u>', '<Plug>Tex_Unit', 'i', '<buffer> <silent>')

" don't autofold
let g:Tex_AutoFolding = 0

" various settings
let g:Tex_FoldedEnvironments = 'abstract,frame'
let g:Tex_FoldedSections = 'part,chapter,section,subsection,subsubsection'
let g:Tex_FoldedMisc = '<<<'
let g:Tex_PromptedEnvironments = 'equation*,align*,equation,align,pmatrix,bmatrix,tabular'
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
