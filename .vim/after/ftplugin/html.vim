if executable('html-beautify')
    let &l:formatprg = 'html-beautify -f - -I -i 2 -A force-expand-multiline -w 80 -s ' . &shiftwidth
endif

augroup htmlformat
    autocmd!
    autocmd BufWritePre *.html :normal! mq gggqG `q
augroup END

