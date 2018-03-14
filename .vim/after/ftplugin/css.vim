if executable('css-beautify')
    let &l:formatprg = 'css-beautify -f - -s ' . &shiftwidth
endif

:augroup cssformat
    autocmd BufWritePre *.css :normal gggqG
:augroup END

