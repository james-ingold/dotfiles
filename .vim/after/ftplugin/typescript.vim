let g:prettier#autoformat = 0
" print semicolons
let g:prettier#config#semi = 'true'

" single quotes over double quotes
let g:prettier#config#single_quote = 'true'

" print spaces between brackets
let g:prettier#config#bracket_spacing = 'true'

let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#parser = 'typescript'
let g:prettier#config#print_width = 140
augroup doPrettier
    autocmd!
    autocmd BufWritePre *.ts PrettierAsync
augroup END

