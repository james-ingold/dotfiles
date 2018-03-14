let s:nameregex = '[a-zA-Z_$0-9]\+'
let s:argsregex = '\(\s*' . s:nameregex . ',\?\)*\s*'
let s:fnregex = '^\s*function\s*' . s:nameregex . '\s*('
let s:end = ')\s*{'

fu! SortAngularDeps()
    let l:cursor_pos = getpos('.')
    call setpos("'q", l:cursor_pos)
    if search('\s*angular', 'w') <= 0
        call cursor(l:cursor_pos[1], l:cursor_pos[2])
        return
    endif
    call cursor(l:cursor_pos[1], l:cursor_pos[2])
    let l:index = 0
    let l:numlines = line('$')
    while l:index <= l:numlines
        let l:l = getline(l:index)
        let l:index+=1
        let l:start =  matchend(l:l, s:fnregex)
        let l:end = match(l:l, s:end)
        if l:start > -1 && l:end > -1
            let l:startStr = matchstr(l:l, s:fnregex)
            let l:endStr = matchstr(l:l, s:end)
            let l:argStr = l:l[(l:start):(l:end-1)]
            let l:args = sort(split(l:argStr, ', '), 'i')
            let l:newLine = l:startStr . join(l:args, ', ') . l:endStr
            call setline(l:index-1, l:newLine)
            return
        endif
    endwhile
endfu

command! -nargs=0 AngularSort call SortAngularDeps()
