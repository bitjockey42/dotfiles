$pdf_mode = 1; # Create PDFs always
$pdflatex = 'pdflatex -interaction=nonstopmode -synctex=1 %O %S && cp "%D" "%R.pdf"';
$pdf_viewer = 'zathura';
$clean_ext = 'acn acr alg aux bbl bcf blg brf fdb_latexmk glg glo gls idx ilg ind ist lof log lot out run.xml toc dvi bbl rel %R-blx.bib %R.synctex.gz';
$out_dir = './output';
$aux_dir = './tmp';

