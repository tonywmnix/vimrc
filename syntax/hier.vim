" Vim syntax file
" Language:    IHDL
" Last change: 2001 Nov 14
" by Davidov Dmitry
"  Updated for vim6 by Mark Waggoner

" Remove any old syntax stuff hanging around
syn clear
" case is not significant
syn case ignore
syntax keyword ihdlpreproc DEFINE
syn match blackstring +".\{-}"+hs=s+1,he=e-1 contained
syn match hierinstance "{[a-zA-Z0-9_#]\{-}}"  contained
syn match hierinstance "{[a-zA-Z0-9_#]\{-}}"  
syn match hierfubname "^[ \t]*[a-z_#0-9]\{-}[{ \t]" contains=hierinstance
syn keyword hierStatement ifc_prefix lbf clock inline leafsch svl hdl_prefix hdl_header code_prefix mkifc_generated 
syn match hierstatement "@" 
syntax match ihdlnodename "\<sourcefile\>"
syn match ihdlIncludes +sourcefile[ \t]\+\".\{-}\"+ contains=blackstring 
syn region hierquot start = "<"hs=b+1 end = ">"he=e-1 contains=ihdlupstring
syn match ihdlupstring +"".\{-}""+ contained 
syn match ihdlupstring +(.\{-})+ contained contains=ihdlstring transparent
syn match ihdlstring +".\{-}"+ contained 
syn match ihdlComment "!.*$"

hi link hierStatement Statement
hi link ihdlpreproc   PreProc
hi link ihdlcomment   Comment
hi link ihdlincludes  Type
hi link ihdlupstring  String
hi link ihdlstring    String

" These shouldn't really be defined here - fix someday...
"
if &background != "dark"
" hi Normal guifg=black
" hi hierStatement gui=NONE guifg=blue
" hi ihdlpreproc gui=bold guifg=darkgreen
" hi ihdlcomment guifg=brown
" hi ihdlincludes gui=bold guifg = purple
" hi ihdlupstring guifg=darkgray gui=bold
" hi ihdlstring gui=bold guifg =darkgray
  hi hierquot guifg=darkcyan
  hi hierfubname guifg=red gui=bold
  hi hierinstance guifg=darkgreen
else
  hi Normal guifg=white
" hi hierStatement gui=NONE guifg=yellow
" hi ihdlpreproc gui=bold guifg=green
" hi ihdlcomment guifg=lightblue
" hi ihdlincludes gui=bold guifg=lightred
" hi ihdlupstring guifg=lightgreen gui=bold
" hi ihdlstring gui=bold guifg=gray
  hi hierquot guifg=lightgray
  hi hierfubname guifg=yellow gui=bold
  hi hierinstance guifg=green
endif
syntax sync maxlines=20

