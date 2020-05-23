if executable('html-beautify')
    let &l:formatprg = 'html-beautify - -I -i 2 -w 120 -s ' . &shiftwidth
else
    echoerr 'html-beautify not found'
endif

augroup htmlformat
    autocmd!
    autocmd BufWritePre *.html :normal! mq gggqG `q
augroup END

