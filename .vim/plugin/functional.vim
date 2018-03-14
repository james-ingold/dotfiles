"Change built-in in-place operators
function! Sorted(l)
   let l:new_list = deepcopy(a:l)
   call sort(l:new_list)
   return l:new_list
endfunction

function! Reversed(l)
    let l:new_list = deepcopy(a:l)
    call reverse(l:new_list)
    return l:new_list
endfunction

function! Append(l, val)
    let l:new_list = deepcopy(a:l)
    call add(l:new_list, a:val)
    return l:new_list
endfunction

function! Assoc(l, i, val)
    let l:new_list = deepcopy(a:l)
    let l:new_list[a:i] = a:val
    return l:new_list
endfunction

function! Pop(l, i)
    let l:new_list = deepcopy(a:l)
    call remove(l:new_list, a:i)
    return l:new_list
endfunction

"Mapped(function("Reversed"), mylist)
function! Mapped(fn, l)
    let l:new_list = deepcopy(a:l)
    call map(l:new_list, string(a:fn) . '(v:val)')
    return l:new_list
endfunction

fu! Filtered(fn, l)
    let l:new_list = deepcopy(a:l)
    call filter(l:new_list, string(a:fn) . '(v:val)')
    return l:new_list
endfu

fu! Removed(fn, l)
    let l:new_list = deepcopy(a:l)
    call filter(l:new_list, '!' . string(a:fn) . '(v:val)')
    return l:new_list
endfu
