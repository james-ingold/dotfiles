" TODO: maybe add an if block here
let &l:formatprg = 'sqlformat --reindent --keywords upper --identifiers lower -'

augroup sqlformat
    autocmd!
    autocmd BufWritePre *.sql :normal! mq gggqG `q
augroup END
