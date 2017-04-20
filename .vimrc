" START vundle

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'hdima/python-syntax'
Plugin 'nvie/vim-flake8'
Plugin 'benmills/vimux'
Plugin 'christoomey/vim-tmux-navigator'


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
set omnifunc=syntaxcomplete#Complete

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

" flake8
autocmd BufWritePost *.py call Flake8()

" open quickfix window after grep
autocmd QuickFixCmdPost *grep* cwindow

" powerline tips and tricks
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup


" automatically quit quickfix window
au BufEnter * call MyLastWindow()
function! MyLastWindow()
    " if the window is quickfix go on
    if &buftype=="quickfix"
        " if this window is last on screen quit without warning
        if winbufnr(2) == -1
            quit!
        endif
    endif
endfunction

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-W>h :TmuxNavigateLeft<cr>
nnoremap <silent> <C-W>j :TmuxNavigateDown<cr>
nnoremap <silent> <C-W>k :TmuxNavigateUp<cr>
nnoremap <silent> <C-W>l :TmuxNavigateRight<cr>
nnoremap <silent> <C-W>w :TmuxNavigatePrevious<cr>

set ts=4
set sw=4
