set nocompatible

" Filetype recognition
filetype indent plugin on

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" Tab width
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set autoindent

" Ask instead of failing if exiting with unsaved changes
set confirm

" Line numbers
set number

" Syntax highlighting
syntax on
colorscheme one

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Edit multiple files in same pane
set hidden

" Show partial commands at the bottom
set showcmd

" Window swaps and mark windows
function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

