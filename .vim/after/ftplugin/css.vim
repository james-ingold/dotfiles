if executable('css-beautify')
    let &l:formatprg = 'css-beautify -f - -s ' . &shiftwidth
endif

augroup cssformat
    autocmd!
    autocmd BufWritePre *.css execute "normal! mzgggqG`z"
augroup END
