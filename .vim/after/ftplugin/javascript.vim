"set suffixesadd+=.js
" using prettier now for formatting javascript instead of js-beautify
"equalprg and formatprg used to define what external program to use for == and gq
 " if executable('js-beautify')
 "     let &l:formatprg = 'js-beautify -f - -j -a -n -s ' . &shiftwidth
 " endif

" augroup javascriptformat
"  autocmd!
"  autocmd BufWritePre *.js :execute 'normal! mq gggqG `q' | AngularSort
" augroup END
"
augroup javascriptformat
 autocmd!
 autocmd BufWritePre *.js :AngularSort
augroup END

