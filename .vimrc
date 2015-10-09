" vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'Valloric/YouCompleteMe'
Plugin 'kien/ctrlp.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'vim-scripts/mru.vim'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'scrooloose/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" end vundle

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

"C++ completion
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
au BufNewFile,BufRead *.cpp set syntax=cpp

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
set fileformats=unix,dos,mac

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

" ctrlp options
let g:ctrlp_custom_ignore = 'node_modules'

" syntastic-react
let g:syntastic_javascript_checkers = ['eslint']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

