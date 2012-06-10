highlight Cursorline guibg=#444444

set lines=50 columns=140

colorscheme koehler
"" Autocommands
au! BufWritePost ~/.vim* source ~/.vimrc
au BufRead,BufNewFile Makefile,*.py          set noexpandtab
" au GuiEnter * set lines=50 columns=140
" au GuiEnter * set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
au GuiEnter * colorscheme koehler
au BufRead,BufNewFile *.c,*.cpp,*.h,*.sv,*.svh,*.vh :IndentGuidesEnable

set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
