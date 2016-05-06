" Tab width
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Line numbers
set number

" Syntax highlighting
:syntax on

" Window swaps and mark windows
function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction
