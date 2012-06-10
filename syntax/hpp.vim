" Vim syntax file
" Language:    HPP Pre-processor
" Last change: 2001 Nov 14
" by Mark Waggoner

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Case insensitive
syntax case ignore

" Comments!
syntax match   hppComment "!.*$"
hi link hppComment    Comment

" Special comments
syntax match   hppFIXME "\v(FIXME|TODO).*$" contained containedin=hppComment
hi link hppFIXME Todo

" Compile time variable declarations
syntax region  hppVariable matchgroup=hppKeyword start="\v<ct(boolean|real|integer|string|node)>" end="endc" 
"contains=hppCtSignalDef
syntax match   hppCtSignalDef "\v\k+" contained

" ASSIGNC ENDC region
syntax region  hppAssign   matchgroup=hppKeyword start="\v<assignc>" end="\v<endc>" contains=hppAssignment,hppIf
" Haven't defined hppAssignment!

" IFC/ENDC region 
" All top level constructs are allowed inside
" THENC and ELSEC are only allowed within this region.
syntax region  hppIf matchgroup=hppKeyword start="\v<ifc>" end="\v<endc>" contains=TOP fold
syntax keyword hppIfKeywords thenc elsec containedin=hppIf contained
hi link hppIfKeywords hppKeyword

" FORC ENDC region
syntax region  hppFor matchgroup=hppKeyword start="\v<forc>" end="\v<endc>" contains=TOP
syntax keyword hppForKeywords upto downto doc containedin=hppFor contained
hi link hppForKeywords hppKeyword


" DEFINE region
syntax region  hppDefine matchgroup=hppKeyword start="\vdefine[ \t\n]+\k+([ \t\n]*\(.{-}\))?[ \t\n]*\=[ \t\n]*\[" end="\v\]" contains=TOP fold
"syntax match   hppDefineID "\v\k+(\(.*\))?[ \t\n]*\=\s*\[" contained containedin=hppDefine
"hi link hppDefineID Type
"syntax region  hppDefineBody start="\v\[" end="\v\]" contained
"syntax keyword hppKeyword define skipwhite nextgroup=hppDefineID
"syntax region  hppDefine matchgroup=hppKeyword start="define" end="\v\]" contains=hppDefineBody,hppDefineID  fold keepend
"syntax match   hppDefineID  "\v\k+(\(.*\))?\s*\=" contained
"hi link hppDefineID Type
"syntax region  hppDefineBody matchgroup=hppKeyword start="\v\[" end="\v\]" contains=TOP transparent contained

" SOURCEFILE
syntax match   hppSourcefile '\vsourcefile\s+\".*\"' contains=hppString
syntax match   hppString    '\v\".{-}\"'hs=s+1,he=e-1 contained

" BEGIN_xxx END_xxx
" Assume that these are defined somewhere
syntax region hppBeginEnd matchgroup=hppKeyword start="\vbegin_\z(\S+)" end="end_\z1" fold contains=TOP

hi link hppCtSignalName Identifier
hi link hppKeyword    PreProc
hi link hppSourcefile Type
hi link hppString     Normal

syn sync fromstart

" Folding
setlocal foldtext=getline(v:foldstart).'\ ('.(v:foldend-v:foldstart).'\ Lines)'

let b:current_syntax = "hpp"

