#
# ~/.latexmkrc
#

$pdflatex = 'pdflatex -halt-on-error -shell-escape %O %S';
$pdf_mode = 1;
$pdf_previewer = 'start okular %O %S &> /dev/null';
$pdf_update_method = 0;
$preview_continuous_mode = 1;
$out_dir = 'build';

# link compiled pdf to source directory
# note that this doesn't work within vimtex, since vimtex overrides $success_cmd
$success_cmd = 'ln -f %D';
