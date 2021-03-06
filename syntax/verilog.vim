" Vim syntax file
" Language:	Verilog
" Maintainer:	Mun Johl <Mun.Johl@emulex.com>
" Last Update:  Fri Oct 13 11:44:32 PDT 2006

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
   syntax clear
elseif exists("b:current_syntax")
   finish
endif

" Set the local value of the 'iskeyword' option
if version >= 600
   setlocal iskeyword=@,48-57,_,192-255
else
   set iskeyword=@,48-57,_,192-255
endif

" A bunch of useful Verilog keywords
syn keyword verilogAlways      always forever
syn keyword verilogBlock       begin    end         initial 
syn keyword verilogFlow        while    for  repeat  wait
syn keyword verilogFunction    function endfunction
syn keyword verilogTask        task     endtask
syn keyword verilogModule      module   endmodule 
syn keyword verilogFork        fork     join
syn keyword verilogEdge        posedge  negedge edge
syn keyword verilogConditional if else case casex casez default endcase
syn keyword verilogDirection   inout input output
syn keyword verilogAttr        unsigned signed
syn keyword verilogEvent       event
syn keyword verilogParam       parameter localparam

syn keyword verilogDataType    assign logic int integer reg real 
syn keyword verilogDataTypeTime time realtime

syn keyword verilogBadWords    wire

syn keyword verilogNetList     bufif0 bufif1 cell cmos buf nand nor nmos wor xnor xor wand weak0 weak1 tranif0 tranif1 tri tri0 tri1 triand
syn keyword verilogNetList     and rnmos rpmos rtran rtranif0 rtranif1 not tran pull0 pull1 pulldown pullup rcmos pmos trior trireg  highz0 highz1 ifnone


syn keyword verilogStatement   and automatic
syn keyword verilogStatement   config deassign defparam design
syn keyword verilogStatement   disable endconfig
syn keyword verilogStatement   endgenerate 
syn keyword verilogStatement   endprimitive endspecify endtable 
syn keyword verilogStatement   force 
syn keyword verilogStatement   generate genvar
syn keyword verilogStatement   incdir include initial 
syn keyword verilogStatement   instance large liblist
syn keyword verilogStatement   library macromodule medium
syn keyword verilogStatement   noshowcancelled notif0 notif1 or
syn keyword verilogStatement   primitive
syn keyword verilogStatement   pulsestyle_onevent pulsestyle_ondetect
syn keyword verilogStatement   scalared showcancelledsmall
syn keyword verilogStatement   specify specparam strong0 strong1
syn keyword verilogStatement   supply0 supply1 table 
syn keyword verilogStatement   use vectored 

syn keyword verilogTodo        contained TODO 
syn keyword verilogFixme       contained FIXME 

syn match   verilogOperator "[&|~><!)(*#%@+/=?:;}{,\^\-\[\]]"
syn match   verilogStatement "[.]"

syn region  verilogComment start="/\*" end="\*/" contains=verilogTodo,verilogFixme,@Spell
"syn region  verilogComment start="ifndef" end="endif" contains=verilogTodo,verilogFixme,@Spell
"syn region  verilogComment start="/\*" end="\*/" contains=verilogTodo,verilogFixme,@Spell
syn match   verilogComment "//.*" contains=verilogTodo,verilogFixme,@Spell

"syn region  verilogIfBlock start="begin" end="end" contains=verilogStatement,verilogLabel


syn match verilogGlobal "`[a-zA-Z0-9_]\+\>"
syn match verilogGlobal "`celldefine"
syn match verilogGlobal "`default_nettype"
syn match verilogGlobal "`define"
syn match verilogGlobal "`else"
syn match verilogGlobal "`elsif"
syn match verilogGlobal "`endcelldefine"
syn match verilogGlobal "`endif"
syn match verilogGlobal "`ifdef"
syn match verilogGlobal "`ifndef"
syn match verilogGlobal "`include"
syn match verilogGlobal "`line"
syn match verilogGlobal "`nounconnected_drive"
syn match verilogGlobal "`resetall"
syn match verilogGlobal "`timescale"
syn match verilogGlobal "`unconnected_drive"
syn match verilogGlobal "`undef"
syn match   verilogGlobal "$[a-zA-Z0-9_]\+\>"

syn match   verilogConstant "\<[A-Z][A-Z0-9_]\+\>"

syn match   verilogNumber "\(\<\d\+\|\)'[sS]\?[bB]\s*[0-1_xXzZ?]\+\>"
syn match   verilogNumber "\(\<\d\+\|\)'[sS]\?[oO]\s*[0-7_xXzZ?]\+\>"
syn match   verilogNumber "\(\<\d\+\|\)'[sS]\?[dD]\s*[0-9_xXzZ?]\+\>"
syn match   verilogNumber "\(\<\d\+\|\)'[sS]\?[hH]\s*[0-9a-fA-F_xXzZ?]\+\>"
syn match   verilogNumber "\<[+-]\=[0-9_]\+\(\.[0-9_]*\|\)\(e[0-9_]*\|\)\>"

syn region  verilogString start=+"+ skip=+\\"+ end=+"+ contains=verilogEscape,@Spell
syn match   verilogEscape +\\[nt"\\]+ contained
syn match   verilogEscape "\\\o\o\=\o\=" contained

" Directives
syn match   verilogDirective   "//\s*synopsys\>.*$"
syn region  verilogDirective   start="/\*\s*synopsys\>" end="\*/"
syn region  verilogDirective   start="//\s*synopsys dc_script_begin\>" end="//\s*synopsys dc_script_end\>"

syn match   verilogDirective   "//\s*\$s\>.*$"
syn region  verilogDirective   start="/\*\s*\$s\>" end="\*/"
syn region  verilogDirective   start="//\s*\$s dc_script_begin\>" end="//\s*\$s dc_script_end\>"

"Modify the following as needed.  The trade-off is performance versus
"functionality.
syn sync minlines=50

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_verilog_syn_inits")
   if version < 508
      let did_verilog_syn_inits = 1
      command -nargs=+ HiLink hi link <args>
   else
      command -nargs=+ HiLink hi def link <args>
   endif

   " The default highlighting.
   HiLink verilogCharacter       Character
"   HiLink verilogConditional     Conditional
   HiLink verilogRepeat		 Repeat
   HiLink verilogString		 String
   HiLink verilogTodo		 Todo
   HiLink verilogFixme	         Fixme
   HiLink verilogComment	 Comment
   HiLink verilogConstant	 Constant
   HiLink verilogLabel		 Label
   HiLink verilogNumber		 Number
   HiLink verilogOperator	 Special
   HiLink verilogStatement	 Statement
   HiLink verilogGlobal		 Define
   HiLink verilogDirective	 SpecialComment
   HiLink verilogEscape		 Special
   HiLink verilogIfBlock	 Block

   HiLink verilogBadWords        Error

   HiLink verilogNetList         Statement

   delcommand HiLink
endif

""" Verilog Specific 
hi verilogAlways         term=bold              gui=bold       guifg=#f0f020       guibg=#a00050
hi verilogBlock          term=bold              gui=bold       guifg=#bfbf60       guibg=#404040
hi verilogFunction       term=bold              gui=bold       guifg=#0fff60       guibg=#404040
hi verilogTask           term=bold              gui=bold       guifg=#0fff60       guibg=#404040
hi verilogModule         term=bold              gui=bold       guifg=#dfbfff       guibg=#404040
hi verilogFork           term=bold              gui=bold       guifg=#ff6fff       guibg=#400000
hi verilogFlow           term=bold              gui=bold       guifg=#ffff60       guibg=bg
hi verilogEdge           term=bold              gui=bold       guifg=#ff3f60       guibg=bg
hi verilogConditional    term=bold              gui=bold       guifg=#ff4ff0       guibg=#000020
hi verilogParam          term=bold              gui=bold       guifg=#808fff       guibg=#000020
hi verilogDirection      term=bold              gui=bold       guifg=#ff5fff       guibg=#000020



let b:current_syntax = "verilog"

" vim: ts=8
