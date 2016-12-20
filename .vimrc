" START vundle

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'hdima/python-syntax'

Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-colorscheme-switcher'

" colors
Plugin 'nielsmadan/harlequin'
Plugin 'liuchengxu/space-vim-dark'
Plugin 'albertocg/contrastneed-theme'
Plugin 'Marfisc/vorange'
Plugin 'roosta/vim-srcery'
Plugin 'MvanDiemen/brighton.vim'
Plugin 'tyrannicaltoucan/vim-deep-space'
Plugin 'dikiaap/minimalist'
Plugin 'davb5/wombat256dave'
Plugin 'encody/nvim'
Plugin 'Blevs/vim-dzo'
Plugin 'kamwitsta/nordisk'
Plugin 'KeitaNakamura/neodark.vim'
Plugin 'tyrannicaltoucan/vim-quantum'
Plugin 'bcicen/vim-vice'
Plugin 'dracula/vim'
Plugin 'YorickPeterse/happy_hacking.vim'


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
set nowrap

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

" share clipborad
set clipboard=unnamed

set nobackup
set nowritebackup
set noswapfile

" color related
set t_Co=256
set background=dark
colorscheme vice
