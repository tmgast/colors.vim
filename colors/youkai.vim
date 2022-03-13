" ensure 256 color
if !has('gui_running') && &t_Co < 256
  finish
endif

" set up the screen
set background=dark

" verify syntax mode
hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'youkai'

let g = {}

let g.black='#1e1e1c'
let g.white='#fff9e3'

let g.red='#864044'
let g.orange='#db846d'
let g.yellow='#ceb459'

let g.primary='#e8e1cf'
let g.primary_dark='#7a7872'
let g.primary_darker='#4A4945'
let g.secondary='#e0bfb4'
let g.tertiary='#84b899'
let g.quaternary='#98b4d9'
let g.quinary='#b9a5d9'

function! SetColor(group, ...)
  let histring = 'hi! ' . a:group . ' '

  if a:0 >= 2 && strlen(a:2)
    let histring .= 'guibg=' . a:2 . ' '
  endif

  if strlen(a:1)
    let histring .= 'guifg=' . a:1 . ' '
  endif

  if a:0 >= 3 && strlen(a:3)
    let histring .= 'gui=' . a:3 . ' '
  endif

  execute histring
endfunction

" initial UI
call SetColor("Normal", g.primary, g.black)
call SetColor("EndOfBuffer", g.primary_darker, g.black)
call SetColor("Comment", g.primary_dark, "","italic")

call SetColor("VertSplit", g.primary, g.primary_dark)
call SetColor("FoldColumn", g.primary, g.primary_dark)
call SetColor("SignColumn", g.primary, g.primary_dark)
call SetColor("LineNr", g.primary_dark)
call SetColor("CursorLineNr", g.primary)

call SetColor("Search", g.primary_darker, g.quinary)
call SetColor("IncSearch", g.primary_darker, g.quinary)

" variables
call SetColor("Constant", g.quaternary)
call SetColor("Number", g.quaternary)
call SetColor("String", g.tertiary)
call SetColor("Type", g.quaternary)

" structs
call SetColor("Function", g.quaternary)
call SetColor("PreProc", g.quinary)
call SetColor("special", g.quinary)
call SetColor("Identifier", g.quinary)
call SetColor("Statement", g.quaternary)

" messages
call SetColor("Error", g.red)
call SetColor("ErrorMsg", g.red)
call SetColor("WarningMsg", g.orange)
call SetColor("MoreMsg", g.yellow)
