" Vim syntax file
" Language:    IHDL - .sig file
" Last change: 2001 Nov 14
" by Mark Waggoner
" Used information from a version by Davidov Dmitry

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" case is not significant
syn case ignore
syn sync minlines=40

syntax region sigNode matchgroup=NONE start='\v^\s*.+\s+(NODE|STATE|BUS)' end="\v\;[ \t]*[\n]*" fold contains=sigNodeType,sigIO,sigDESC,hppComment,hppIf,hppFIXME,hppFor,hppIfKeywords,hppForKeywords
syntax keyword sigNodeType NODE STATE BUS RTRI WOR WAND TRI NTRI RTRI RNTRI PP NP contained
syntax match sigIO  "\v^\s*(INPUT|OUTPUT|IOPUT)"  contained
syntax region sigDESC start='\vDESC\s+\{' end='\v\}' contained contains=sigDESCString
syntax region sigDESCString start='\v\"' end='\v\"' contained
syntax region sigScope matchgroup=sigKeyword start="\vscope\s+\S+\s+\{" end="\v\}" transparent fold

hi link sigNode Identifier
hi link sigIO   Keyword
hi link sigNodeType Keyword
hi link sigDESC Keyword
hi link sigDESCString String
hi link sigScope Keyword

" Read the HPP syntax 
if version < 600
  so <sfile>:p:h/hpp.vim
else
  runtime! syntax/hpp.vim
  unlet b:current_syntax
endif

syntax sync fromstart

let b:current_syntax = "sig"

