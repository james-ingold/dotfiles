let g:prettier#autoformat = 0
" print semicolons
let g:prettier#config#semi = 'true'

" single quotes over double quotes
" let g:prettier#config#single_quote = 'true'

" print spaces between brackets
let g:prettier#config#bracket_spacing = 'true'

let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#parser = 'typescript'
let g:prettier#config#print_width = 120

" number of spaces per indentation level: a number or 'auto' (use
" softtabstop)
" default: 'auto'
let g:prettier#config#tab_width = 'auto'


" use tabs instead of spaces: true, false, or auto (use the expandtab setting).
" default: 'auto'
let g:prettier#config#use_tabs = 'auto'

" always|never|preserve
" default: 'preserve'
let g:prettier#config#prose_wrap = 'preserve'
augroup doPrettier
    autocmd!
    autocmd BufWritePre *.ts PrettierAsync
augroup END

