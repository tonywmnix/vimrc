" vim: tw=0 ts=4 sw=4 syntax=mycolortest
" Vim color file
" Maintainer:   Ron Aaron <ron@ronware.org>
" Last Change:   2006 Dec 10
hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "koehler"

hi Normal         ctermfg=white ctermbg=black            guifg=white         guibg=#333333
hi Visual         term=none                                                  guibg=#666666

hi Search          term=none  cterm=underline  ctermfg=yellow  ctermbg=NONE  gui=undercurl,bold  guifg=NONE guibg=blue    guisp=red 
hi IncSearch       term=none  cterm=underline  ctermfg=red   ctermbg=yellow  gui=undercurl,bold  guifg=NONE guibg=red     guisp=blue

                
hi Cursor                          gui=none              guifg=bg guibg=fg
hi CursorLine       ctermbg=NONE cterm=none              gui=none    guibg=#222222
hi CursorColumn     ctermbg=NONE             cterm=none  gui=none    guibg=#222222

hi Scrollbar                                             guifg=darkcyan      guibg=darkgray
hi Menu                                                  guifg=black         guibg=#203040
hi SpecialKey      term=none gui=none                    guifg=#111111       guibg=NONE
hi NonText         term=bold              gui=bold       guifg=#cc0000       guibg=bg
hi Directory       term=bold                             guifg=#cc8000       guibg=bg
hi ErrorMsg        term=standout                         guifg=White         guibg=Red
hi MoreMsg         term=bold              gui=bold       guifg=SeaGreen      guibg=bg
hi ModeMsg         term=bold              gui=bold       guifg=White         guibg=Blue
hi LineNr                            ctermfg=darkgray    guifg=#444444       
hi Question        term=standout          gui=bold       guifg=Green         guibg=bg
hi StatusLine      gui=italic guifg=#262626 guibg=fg
hi StatusLineNC    guifg=#262626 guibg=#080808
hi Title           term=bold              gui=bold       guifg=Magenta       guibg=bg
hi WarningMsg      term=standout          gui=NONE       guifg=Red           guibg=bg
hi Comment         term=bold              gui=italic     guifg=lightblue2    guibg=bg
hi Constant        term=underline                        guifg=#ffa0a0       guibg=bg
hi Special         term=bold                             guifg=Orange        guibg=bg
hi Identifier      term=underline                        guifg=#40ffff       guibg=bg
hi IfBlock                                                                   guibg=#222222
hi Statement       term=bold              gui=bold       guifg=#ffff60       guibg=bg
hi Conditional     term=bold              gui=bold       guifg=#ffff20       guibg=bg
hi Label           term=bold              gui=bold       guifg=#4080ff       guibg=bg
hi PreProc         term=underline                        guifg=#ff80ff       guibg=bg
hi Type            term=underline         gui=bold       guifg=#60ff60       guibg=bg
hi Error           term=reverse           gui=reverse    guifg=Red           guibg=Black
hi Todo            term=standout          gui=underline  guifg=Blue          guibg=Yellow 
hi Fixme           term=standout          gui=underline  guifg=black         guibg=red    
hi MatchParen      term=bold         gui=bold,underline                           guibg=#666666 
" ( )
hi TabLine         term=bold,reverse      gui=bold       guifg=blue          guibg=white
hi TabLineFill     term=bold,reverse      gui=bold       guifg=blue          guibg=white
hi TabLineSel      term=reverse                          guifg=white         guibg=blue


hi PMenu           term=NONE              gui=none       guifg=gray         guibg=#203040    
hi PMenuSel        term=bold              gui=bold       guifg=yellow    guibg=#333333   
hi PMenuSbar       term=bold              gui=bold                           guibg=#203040
hi PMenuThumb      term=bold              gui=bold                           guibg=#999999

hi link String         Constant
hi link Character      Constant
hi link Number         Constant
hi link Boolean        Constant
hi link Float          Number
hi link Function       Identifier
hi link Conditional    Statement
hi link Repeat         Statement
hi link Operator       Statement
hi link Keyword        Statement
hi link Exception      Statement
hi link Include        PreProc
hi link Define         PreProc
hi link Macro          PreProc
hi link PreCondit      PreProc
hi link StorageClass   Type
hi link Structure      Type
hi link Typedef        Type
hi link Tag            Special
hi link SpecialChar    Special
hi link Delimiter      Special
hi link SpecialComment Special

hi link Debug          Special


hi DiffAdd     gui=NONE guibg=#222222
hi DiffChange  gui=NONE guibg=black
" hi DiffChange  gui=NONE guibg=black guifg=white
hi DiffText    gui=NONE guibg=#444444
" hi DiffText    gui=bold guibg=black guifg=magenta
hi DiffDelete  gui=NONE guibg=black guifg=#444444

hi Folded      term=standout   gui=NONE guibg=#222222 guifg=cyan
hi FoldColumn  term=standout  ctermbg=black gui=NONE guifg=Cyan guibg=black



