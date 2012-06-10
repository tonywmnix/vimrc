" Vim syntax file
" Language:    IHDL
" Last change: 1998 Jan 8
" by Davidov Dmitry
" Last change: 2001 Oct 15
" by Mark Waggoner
" Last change: 2004 Mar 22
" by Frank O'Bleness
"    - added add'l syntax highlights for comments & add'l keywords
"    - cleaned up syntax errors on conversion

" Remove any old syntax stuff hanging around
if version < 600
  syn clear
elseif exists("b:current_syntax")
  finish
endif

" case is not significant
syn case ignore

" Begin/End of hrcs revision log
syntax region rcsRevLog start='^\! \$Log: ' end='^[^\!]' contains=TOP fold

" Begin/End of unnamed sections
syntax region ihdlSection1 matchgroup=ihdlStatement1 start=!\v<begin>\s*$\@=! end=!\v<end\s*\;! contains=TOP fold
syntax region ihdlSection1 matchgroup=ihdlStatement1 start=!\v<begin>((\s+[^"])\|$)\@=! end=!\v<end\s*\;! contains=TOP fold

" Begin/End of named sections
"syntax region ihdlsection2 matchgroup=ihdlstatement2 start=!\v<begin>[ \t\n]+\z(\"[^"]+\")! end=!\v<end[ \t\n]+\z1\_[^;]*;! contains=TOP fold
syntax region ihdlsection2 matchgroup=ihdlstatement2 start=!\v<begin>[ \t\n]+\z(\"[^"]+\")! end=!\v<end[ \t\n]+\z1! contains=TOP fold

hi link ihdlStatement1 ihdlStatement
hi link ihdlStatement2 ihdlStatement

" ihdl keywords
syn keyword ihdlStatement begin_dbg end_dbg always assert
syn keyword ihdlStatement behavioral case cond whenstable
syn keyword ihdlStatement config contention continue 
syn keyword ihdlStatement direct disablelisting end_inst 
syn keyword ihdlStatement disablemacroexpansion do done else
syn keyword ihdlStatement enablelisting enablemacroexpansion
syn keyword ihdlStatement enumerate own contained 
syn keyword ihdlStatement if falling false for
syn keyword ihdlStatement interface main 
syn keyword ihdlStatement nodrive of on implies tagged_signals
syn keyword ihdlStatement otherwise own ports eventually
syn keyword ihdlStatement precharge resolve
syn keyword ihdlStatement retain return rising ro rw 
syn keyword ihdlStatement stable structural
syn keyword ihdlStatement then to true until t_begin t_end
syn keyword ihdlStatement weakpull while with wo t_then t_select

syn keyword ihdlStatement doc forc endc ifc thenc begin_inst begin end upto downto

syn keyword protokeywords mapping change_on reset_on type capacity t_excluded T_FORBIDDEN mode severity fail_report proto hdl global_window inactive_value succ_report internal P6_FORBIDDEN P6_MUTEX
syn match protoinst "{[a-zA-Z0-9#_, ]\{-}}"

syn match ihdlstring "^[ \t]*[A-Z0-9_#[\]]\+[ \t]\{-}:[ \t]*tfsm" contains=protokeywords,ihdlnohighlight
syn match ihdlstring "^[ \t]*proto_block.*$" contains=protokeywords,ihdlnohighlight
syn match ihdlstring "^[ \t]*proto_fub.*$" contains=protokeywords,ihdlnohighlight
syn keyword protokeywords proto_block tfsm proto_fub contained 
syn match protoextens "^[ \t]*[A-Z0-9_#[\]]\+[ \t]\{-}:[ \t]*skew" contains=ihdlstatement
syn match protoextens "^[ \t]*[A-Z0-9_#[\]]\+[ \t]\{-}:[ \t]*trigger" contains=ihdlstatement
syn keyword ihdlstatement skew contained trigger
syn keyword ihdlstatement skew trigger
"Numbers and operators:
"syn match ihdlString +"\{-}"+ contained
syn match ihdlVector "'[0-9a-f_:]\+"   contained contains=ihdloperator
syn match ihdlNumber "\<[0-9:]\+\>" contained contains=ihdloperator
syn match ihdlVector "'[0-9a-f_:]\+" contains=ihdloperator
syn match ihdlNumber "\<[0-9:]\+\>" contains=ihdloperator

syn match   ihdlOperator "[&><=:+\-*\/|]" contained
syn match   ihdlOperator "\$[A-Za-z]{-,20}" contained
syn match   ihdlOperator "[&><=:+\-*\/|]"  
syn match   ihdlOperator "\$[A-Za-z]\{-,20}\>" 
" added to include exponential
syn match   ihdlOperator "[\^]" 

syn keyword ihdlOperator and nand or nor xor xnor div t_or t_and t_xor t_spawn
syn keyword ihdlOperator rol ror sla sll sra srl ox sx
syn keyword ihdlOperator mod rem abs not shr shl shl1 shr1
syn keyword ihdlOperator and nand or nor xor xnor div contained
syn keyword ihdlOperator rol ror sla sll sra srl contained
syn keyword ihdlOperator mod rem abs not shr shl shl1 shr1 contained

" @tests:
syntax region ihdlTesters matchgroup=NONE start="@\=@.\{-}(" skip="(.\{-}),  " end="[);]"he=e-1 contains=ihdlnohighlight,ihdlstatement oneline 
syntax match ihdltesters "@\=@[A-Za-z0-9_#]\+"
"nodes installation :
syn match ihdlInsertion "%.\{-}%" contained
syn match ihdlnohighlight "\[.\{-}\]" contained contains=ihdlnumber,ihdlvector,ihdloperator
syn match ihdlnohighlight "[,;={}]" contained
syn match ihdlnohighlight ";.*" contained contains=hppComment
syn match ihdlnohighlight "\[.\{-}\]" contains=ihdlnumber,ihdlvector,ihdloperator
syn match ihdlnohighlight "(.\{-})" contained contains=ihdlnumber,ihdlvector,ihdloperator,ihdlstring
syn match ihdlInsertion "%.\{-}%" 
syntax keyword ihdlnode generic modifies produces uses

"syntax keyword ihdlNodeName field attribute fieldtype enumtype rtri

syntax keyword ihdlstatement input output ioput bus

syntax match protokeywords "\<set\>"
syntax match  protokeywords "\<set\> \+.\{-}[; \t(]"he=e-1  contains=ihdlsignalname 
syntax match  ihdlStatement "\<nextstate\> \+.\{-}[; \t(]"he=e-1  contains=ihdlSignalname 
syntax match  ihdlStatement "\<presentstate\> \+.\{-}[; \t(]"he=e-1  contains=ihdlSignalname 

" added comment match
"syn match ihdlComment "!.*$"
"syn match ihdlComment "*!.*$"

" added reserved characters
syn match ihdlReserved1 "[\[\]()]"
syn match ihdlReserved2 "[.;]"


" Node declarations
syntax match  ihdlnode "\v<(node|state|wand|rom|wor|clock|pp|np|tri|rtri|ntri|rntri|boolean|real|internal|string|integer)>\s+.{-}[; \t(]"he=e-1  contains=ihdlSignalname 
syntax match  ihdlnode "\<attribute\> \+.\{-}[; \t(]"he=e-1  contains=ihdlSignalname 
syntax match  ihdlnode "\<enumtype\> \+.\{-}[; \t(]"he=e-1  contains=ihdlSignalname 
syntax match  ihdlnode "\<enumerate \{-}(.\{-}) \+.\{-}[; \t(]"  contains=ihdlqSignalname,ihdlStatement
syntax match  ihdlnodef "\<fieldtype\> .\{-}[; \t(]"he=e-1  contains=ihdlSignalname
syntax match  ihdlnodef "\<field\> \+(.\{-}) \{-}.\{-}[; \t(]"he=e-1  contains=ihdlqSignalname

" Signal names within a node definition
syntax match  ihdlSignalname  " \+.\{-}[; \t(]"he=e-1   contained contains=ihdlInsertion,ihdlnohighlight,ihdlstatement,ihdlkeywordprefix
syntax match  ihdlqSignalname ") \{-}.\+[; \t]"hs=s+1,he=e-1   contained contains=ihdlInsertion,ihdlnohighlight 
hi link ihdlqSignalname ihdlSignalname

hi link ihdlindefine ihdlincludesname
hi link ihdlInstallSig hppcomment
"Keywords with prefixes:
syn match ihdlKeywordPrefix "fub *\<.\{-}\>" 
syn match ihdlKeywordPrefix "subfub *\<.\{-}\>" 
syn match ihdlKeywordPrefix "subfub *inline *\<.\{-}\>" 
syn match ihdlKeywordPrefix "subfub *inline *ignorep *\<.\{-}\>"
syn match ihdlKeywordPrefix "fsm *\<.\{-}\>" 
syn match ihdlKeywordPrefix "tslproc *\<.\{-}\>" contained
syn match ihdlKeywordPrefix "tslproc *\<.\{-}\>" 
syn match ihdlKeywordPrefix "physblock *\<.\{-}\>" 
syn match ihdlKeywordPrefix "behavblock *\<.\{-}\>" 
syn match ihdlKeywordPrefix "procedure *\<.\{-}\>" 

" added source file as keyword
syn keyword ihdlAdditionalKeywords sourcefile define

syn match ihdlString +".\{-0,}"+  

" floating numbers
syn match ihdlNumber "-\=\<[0-9]\+\.[0-9]\+\(E[+\-]\=[0-9]\+\)\>"
syn match ihdlNumber "-\=\<[0-9]\+\.[0-9]\+\>"
syn match ihdlNumber "0*2#[01_]\+\.[01_]\+#\(E[+\-]\=[0-9]\+\)\="
syn match ihdlNumber "0*16#[0-9a-f_]\+\.[0-9a-f_]\+#\(E[+\-]\=[0-9]\+\)\="
" integer numbers
syn match ihdlNumber "-\=\<[0-9]\+\(E[+\-]\=[0-9]\+\)\>"
syn match ihdlNumber "0*2#[01_]\+#\(E[+\-]\=[0-9]\+\)\="
syn match ihdlNumber "0*16#[0-9a-f_]\+#\(E[+\-]\=[0-9]\+\)\="

syn match ihdltesters1 "^[ \t]\{-}@.*$" contains=hppComment,ihdlnohighlight



" Main groups are:
" Comment
" Constant
" Identifier
" Statement
" PreProc
" Type
" Special
" Underlined
" Ignore
" Error
" Todo

hi link ihdltesters1 ihdltesters
hi link ihdlnohightlight Identifier
hi link ihdlInsertion Type
hi link ihdlpreproc TPreProc
hi link ihdlKeywordPrefix Statement 
hi link ihdlKeywordPrefixw Comment
hi link ihdlKeywordPrefixwords  Statement
hi link ihdlnode Type
hi link ihdlnodef Type
hi link ihdlSignalname String
hi link ihdlTesters Type
hi link ihdlStatement Statement
hi link ihdlCharacter String
hi link ihdlString    String
hi link ihdlVector    String
hi link ihdlBoolean   String
hi link ihdlNumber    String
hi link ihdlType      Type
hi link ihdlOperator  Type
hi link ihdlNodeName Statement

" added hilite for ihdlcomments & addl keywords
"hi link ihdlComment Comment
hi link ihdlAdditionalKeywords Statement
hi link ihdlReserved1    Comment
hi link ihdlReserved2    Type

" FIX THESE!
if &background != "dark"
  hi protoextens gui=bold guifg=black
  hi blackstring guifg=magenta
  hi protokeywords gui=bold guibg=white guifg=red
  hi protoinst guifg=red
else
  hi protoextens gui=bold guifg=white
  hi blackstring guifg=lightmagenta
  hi protokeywords gui=bold guifg=lightred
  hi protoinst guifg=lightred
endif

" Read the HPP syntax
if version < 600
  so <sfile>:p:h/hpp.vim
else
  runtime syntax/hpp.vim
" FIX THIS? HAD SYNTAX ERRORS ON CONVERSION TO IHDL???
"  unlet b:current_syntax
endif

syn sync fromstart

"let b:current_syntax = "ihdlc"
let b:current_syntax = "ihdl"


