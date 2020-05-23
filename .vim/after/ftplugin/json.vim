if executable('jq')
    let &l:formatprg = 'jq .'
else
    echoerr 'jq not found'
endif

augroup jsonformat
    autocmd!
    autocmd BufWritePre *.json :normal! mq gggqG `q
augroup END
