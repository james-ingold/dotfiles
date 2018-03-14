" setlocal foldmethod=expr
" setlocal foldexpr=GetJSFold(v:lnum)

" fu! GetJSFold(lnum)
"     if getline(a:lnum) =~? '\v^\s*$'
"         return '-1'
"     endif
"     let l:this_indent = IndentLevel(a:lnum)
"     let l:next_indent = IndentLevel(NextNonBlankLine(a:lnum))

"     if l:next_indent == l:this_indent
"         return l:this_indent
"     elseif l:next_indent < l:this_indent
"         return l:this_indent
"     elseif l:next_indent > l:this_indent
"         return '>' . l:next_indent
"     endif
" endfunction

" fu! IndentLevel(lnum)
"     return indent(a:lnum) / (&shiftwidth * 4)
" endfunction

" function! NextNonBlankLine(lnum)
"     let l:numlines = line('$')
"     let l:current = a:lnum + 1

"     while l:current <= l:numlines
"         if getline(l:current) =~? '\v\S'
"             return l:current
"         endif

"         let l:current += 1
"     endwhile

"     return -2
" endfunction
