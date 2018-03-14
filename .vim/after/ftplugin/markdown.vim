setlocal textwidth=120
augroup markdownformatter
    autocmd!
    autocmd BufWritePre *.markdown,*.md,*.mdown,*.mkd,*.mkdn :Prettier
augroup END
