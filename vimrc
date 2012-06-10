filetype plugin indent on

syntax on
colorscheme koehler

set noignorecase
set smartcase
set backspace=eol,start,indent
set autoindent
set tabstop=4
set expandtab
set shiftwidth=4
set number
set incsearch
set hlsearch
set showcmd
set wildmenu
set hidden
set nowrap
set ru
set display=uhex
set softtabstop=4
set cmdheight=2
set novisualbell
set history=800
set diffopt=vertical
set vb t_vb=.
set autoread



let &efm .=',%EError%*[^\n],%C  %[A-Z]%*[^\n],%+C  [%f]\,,%+Z  %l: %m,%EError%*[^\n],%C  %[A-Z]%*[^\n],%+C  "%f"\,,%+Z  %l: %m,%-WWarning-[SIOB] %m,%-Z%f\, %l'

let g:miniBufExplMapWindowNavVim = 1
" set foldmethod=syntax
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplorerMoreThanOne = 1 
let g:miniBufExplSplitBelow=1 
let b:TypesFileRecurse = 1

let g:netrw_preview=0
let g:netrw_special_syntax = 0


let g:SrcExpl_refreshTime = 100
let g:SrcExpl_searchLocalDef = 0
let g:SrcExpl_gobackKey = ''
let g:SrcExpl_jumpKey = ''
let g:SrcExpl_winHeight = 8
let g:SrcExpl_isUpdateTags = 0
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeHijackNetrw = 1
let g:NERDTreeMapPreview = 0
let g:Tlist_Use_Left_Window = 1
let g:Tlist_WinWidth = 24
let g:Tlist_Sort_Type = "order"
let g:Tlist_Compact_Format = 1
let g:Tlist_Exit_OnlyWindow = 1
let g:Tlist_File_Fold_Auto_Close = 1
let g:Tlist_Enable_Fold_Column = 1
let g:Tlist_Show_One_File = 1
let Tlist_Auto_Highlight_Tag = 0
let Tlist_Highlight_Tag_On_BufEnter = 0


let g:SrcExpl_winHeight = 8
let g:SrcExpl_refreshTime = 500
let g:SrcExpl_pluginList = [ "__Tag_List__", "_NERD_tree_", "NERD_tree_1","NERD_tree_*", "NERD*", "Source_Explorer", "-MiniBufExplorer-" ]
let g:SrcExpl_searchLocalDef = 1
let g:SrcExpl_isUpdateTags = 0
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."
let g:SrcExpl_updateTagsKey = "<F10>"

"let loaded_taglist = 1
let g:tlist_systemverilog_settings = 'systemverilog;c:class;t:task;p:program;e:type;f:function;d:define;m:module;I:inputs;O:outputs'
let g:tlist_verilog_systemverilog_settings = 'systemverilog;c:class;t:task;p:program;e:type;f:function;d:define;m:module;P:port;I:inputs;O:outputs'

let g:NERDTreeWinSize = 23
let g:NERDTreeWinPos = "right"
let g:NERDTreeAutoCenter = 0
let g:NERDTreeHighlightCursorline = 1

command! -bar Hexmode call ToggleHex()

"" Key Mappings
nnoremap       <C-L> :nohl<CR><C-L>
map <S-F12>    <ESC>:Hexmode<CR>
map <S-F5>     <ESC>:cp<CR>
map <S-F6>     <ESC>:cn<CR>
map <F5>       <ESC>:e<CR>
map <F6>       <ESC>:NERDTreeToggle<CR>
map <F7>       <ESC>:SrcExplToggle<CR>
map <F12>      <ESC>:TrinityToggleAll<CR>
map <C-Right>  <ESC>:tabnext<CR>
map <C-Left>   <ESC>:tabprev<CR>
map <C-Up>     <ESC>:bnext<CR>
map <C-Down>   <ESC>:bprevious<CR>
map <C-t>      <ESC>:tabnew<CR>
map <C-a>      <ESC><C-w>w




" Custom commands
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif


" let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 10
