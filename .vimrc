call plug#begin('~/.vim/plugged')

Plug 'funorpain/vim-cpplint'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-commentary'

" python
Plug 'nvie/vim-flake8'
Plug 'vim-scripts/indentpython.vim'
Plug 'hdima/python-syntax'
Plug 'tell-k/vim-autopep8'
Plug 'Valloric/YouCompleteMe'

" misc languages
Plug 'onerobotics/vim-karel'
Plug 'vim-latex/vim-latex'

Plug 'benmills/vimux'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-dispatch'
Plug 'airblade/vim-gitgutter'
Plug 'godlygeek/tabular'
Plug 'haya14busa/incsearch.vim'

" colors
Plug 'flazz/vim-colorschemes'

call plug#end()

filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

" vim native features
set ic
set ar
set nowrap
set encoding=utf-8

" incsearch
set incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)

" share clipborad
set clipboard=unnamedplus

set nobackup
set nowritebackup
set noswapfile
set ts=4
set sw=4
set softtabstop=4
set autoindent
set et

" color related
set t_Co=256
set background=dark
colorscheme badwolf

" python indentation
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 expandtab autoindent fileformat=unix

" python syntax highlighting
let python_highlight_all=1
syntax on

" Highlight the trailing whitespace
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

" YCM options
let g:ycm_add_preview_to_completeopt = 1

" open quickfix window after grep
autocmd QuickFixCmdPost *grep* cwindow


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

" Jump to matching HTML tags with %
runtime macros/matchit.vim

" enable mouse
set mouse=a

set foldlevelstart=20

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" make background transparent
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE

" fzf
command! -bang -nargs=* GGrep call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, <bang>0)
map <C-p> :FZF<CR>

" flake8
autocmd BufWritePost *.py call Flake8()
