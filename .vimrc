execute pathogen#infect()
set nocompatible
syntax on

set ruler      " show the cursor position at all time
set number
set showcmd    " show incomplete commands
set incsearch  " do incremental searching
set hlsearch   " highlight search results

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

set autoindent
set paste       " ignore tabs when I paste stuff as to not mess up indentation
colorscheme slate

" Enable mouse
" set mouse=a

" Always display the status line
set laststatus=2

:highlight ExtraWhitespace ctermbg=red guibg=red
" Show trailing whitespace
" from http://vim.wikia.com/wiki/Highlight_unwanted_spaces
:match ExtraWhitespace /\s\+\%#\@<!$/
" Remove all trailing whitespace by hitting F5
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Ctrl+L = PHP Lint!
set runtimepath^=~/.vim/bundle/ctrlp.vim

function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
