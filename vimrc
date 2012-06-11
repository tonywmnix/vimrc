filetype plugin indent on

if &t_Co >= 256 || has("gui_running")
    colorscheme koehler
else
    colorscheme koehler
endif

if &t_Co > 2 || has("gui_running")
   " switch syntax highlighting on, when the terminal has colors
   syntax on
endif

nnoremap ; :
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

"" Searching ""
set ignorecase
set smartcase
set incsearch
set hlsearch

" Tabbing/Spaces
set backspace=eol,start,indent
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set mouse=a
set number
set showcmd
set wildmenu
set hidden
set nowrap
set ru
set display=uhex
set cmdheight=2
set novisualbell
set history=800
set diffopt=vertical,filler,context:1
set vb t_vb=.
" set autoread
set nolazyredraw
set magic
set showmatch
set guioptions=acegimrLbhpT "aegimrlt
set nobackup
set nowb
set noswapfile
set laststatus=2
set scrolljump=16

set foldmethod=marker
set foldcolumn=4

"set statusline=%m%r%h\ [%ll/%LL:%cc]\ [ASCII\ %3b\ 0x%02B]\ %=\ [b%n]\ [%P]\ %w[%f]
set statusline=%m%r%h\ [l%l/%L:c%c]\ %=\ [b%n]\ [%P]\ %w[%f]

" let &efm .=',%EError%*[^\n],%C  %[A-Z]%*[^\n],%+C  [%f]\,,%+Z  %l: %m,%EError%*[^\n],%C  %[A-Z]%*[^\n],%+C  "%f"\,,%+Z  %l: %m,%-WWarning-[SIOB] %m,%-Z%f\, %l'
" let &efm .=',%EError%*[^\n],%C  %[A-Z]%*[^\n],%+C  [%f]\,,%+Z  %l: %m,%EError%*[^\n],%C  %[A-Z]%*[^\n],%+C  "%f"\,,%+Z  %l: %m'

let g:acp_enableAtStartup = 0
let c_no_tab_space_error = 1

if has("python3")
    command! -nargs=1 Py py3 <args>
    py3file ~/.vim/vimrc-functions.py
else
    command! -nargs=1 Py py <args>
    pyfile ~/.vim/vimrc-functions.py
endif

" If you are still getting used to Vim and want to force yourself to stop using the arrow keys, add this:
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>

source  ~/.vim/vimrc-functions
source  ~/.vim/vimrc-keys
source  ~/.vim/vimrc-autocmd
source  ~/.vim/vimrc-pluginsettings
source  ~/.vim/vimrc-highlight

if  has("gui_running")
else
imap A <ESC>ki
imap B <ESC>ji
imap C <ESC>li
imap D <ESC>hi
set nocompatible
" This fixes '.' being inserted when using arrow keys 
set term=xterm
endif

set tabpagemax=50
set autowrite

