" Vim plugin for sorting headers & imports
" Last Change: Sat Jan  7 14:12:29 IST 2012
" Maintainer: Ashish Anand <ashishb4u on Google's email service>
" License:  This file is placed in the public domain.

if exists("g:loaded_sortheaders")
  finish
endif

let g:loaded_sortheaders = 1

let s:save_cpo = &cpo
let s:headerRegions = []
set cpo&vim

" Filetype support check
function s:checkFileType()
    let s:ft = &ft
    if s:ft == "c" || s:ft == "cpp"
        return 1
    endif
    echo "SortHeaders: FileType not supported!"
    return 0
endfunction

function s:sortHeaderRegions()
    for region in s:headerRegions
        let lines = getline(region[0], region[1])
        call sort(lines)
        for i in range(region[0], region[1])
            call setline(i, lines[i-region[0]])
        endfor
    endfor
endfunction

function s:addToHeaderRegion(line)
    let i = 0
    for region in s:headerRegions
        let stLine  = region[0]
        let endLine = region[1]
        if endLine == a:line - 1
            let s:headerRegions[i] = [stLine, a:line]
            return
        endif
    let i += 1
    endfor

    " Insert a new region
    let s:headerRegions += [[a:line, a:line]]
endfunction

function s:SortHeaders()
    let check = s:checkFileType()
    if check == 0
        return
    endif
    let headerPattern = "#include"
    let flags = "W"
    let cur = [1,1]

    " Always begin from top of the file
    call cursor(cur)
    let line = search(headerPattern, flags)
    while line > 0
        call s:addToHeaderRegion(line)
        let line = search(headerPattern, flags)
    endwhile

    call s:sortHeaderRegions()
endfunction

if !exists(":SortHeaders")
  command -nargs=0 SortHeaders  :call s:SortHeaders()
endif

let &cpo = s:save_cpo

