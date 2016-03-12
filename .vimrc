set nocompatible

" display settings
set number 
set cursorline
set cursorcolumn
set laststatus=2
set cmdheight=2
set showmatch
set helpheight=999
syntax on

" cursor settings
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]
set scrolloff=8
set sidescrolloff=16
set sidescroll=1

" file settings
set confirm
set hidden
set autoread
set nobackup

" tab settings
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent

" inoremap
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap () ()<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
