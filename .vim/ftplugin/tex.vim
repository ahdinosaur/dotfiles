" Compile tex file to pdf and view it.
map <buffer> <S-e> :w<CR>:! pdflatex % <CR>:! xdg-open %:r.pdf <CR>
