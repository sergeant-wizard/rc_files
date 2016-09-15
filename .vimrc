" START vundle

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on

" END vundle

" python indentation
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 expandtab autoindent fileformat=unix

" python syntax highlighting
let python_highlight_all=1
syntax on

set encoding=utf-8

" ctrlp options
let g:ctrlp_custom_ignore = 'node_modules'

" vim native features
set ic
set ar
set incsearch

set cursorline
hi CursorLine term=bold cterm=bold ctermbg=black
set scrolloff=4

" Highlight the trailing whitespace
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

" YCM options
let g:ycm_add_preview_to_completeopt = 1

" make backspace work over lines
set backspace=indent,eol,start

