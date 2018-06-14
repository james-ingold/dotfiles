if executable('html-beautify')
    let &l:formatprg = 'html-beautify -f - -I -i 2 -w 80 -A auto -s ' . &shiftwidth
endif

augroup htmlformat
    autocmd!
    autocmd BufWritePre *.html :normal! mq gggqG `q
augroup END

