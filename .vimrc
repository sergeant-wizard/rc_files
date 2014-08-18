set ic
set ar
set incsearch

set cursorline
hi CursorLine term=bold cterm=bold ctermbg=black
set scrolloff=4

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent

set nowrap

syntax on
filetype on
filetype indent on
filetype plugin on

"C++ completion
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main

"vim-latex
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

set backspace=indent,eol,start

"vim-ruby
set nocompatible
autocmd FileType ruby compiler ruby

"common typos
:command WQ wq
:command Wq wq
:command W w
:command Q q

"ctrl-pageup
nmap    <ESC>[5^    <C-PageUp>
nmap    <ESC>[6^    <C-PageDown>
nnoremap <C-PageDown> gt
nnoremap <C-PageUp> gT

language messages C
set termencoding=utf8
set encoding=utf8
set fileencoding=utf8
"set fileformats=dos
set fileformats=unix,dos

execute pathogen#infect()

:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

colorscheme default
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  guibg=red   ctermbg=3
hi IndentGuidesEven guibg=green ctermbg=4

" Highlight the trailing whitespace
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END
