" START vundle

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" fuzzy search
" Plugin 'junegunn/fzf.vim'
" Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'ctrlpvim/ctrlp.vim'

" python
Plugin 'vim-scripts/indentpython.vim'
Plugin 'hdima/python-syntax'
Plugin 'nvie/vim-flake8'
Plugin 'Valloric/YouCompleteMe'

" misc languages
Plugin 'onerobotics/vim-karel'
Plugin 'vim-latex/vim-latex'

" tmux
Plugin 'benmills/vimux'
Plugin 'christoomey/vim-tmux-navigator'

Plugin 'tpope/vim-surround'
Plugin 'majutsushi/tagbar'
Plugin 'airblade/vim-gitgutter'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-sensible'
Plugin 'taglist.vim'
Plugin 'haya14busa/incsearch.vim'

" colors
Plugin 'bcicen/vim-vice'

call vundle#end()
" END vundle

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
set clipboard=unnamed

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
colorscheme vice

" python indentation
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 expandtab autoindent fileformat=unix

" python syntax highlighting
let python_highlight_all=1
syntax on

" ctrlp options
let g:ctrlp_custom_ignore = 'node_modules'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']
let g:ctrlp_extensions = ['tag', 'dir']
let g:ctrlp_types = ['fil', 'mru', 'tag']


" Highlight the trailing whitespace
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

" YCM options
let g:ycm_add_preview_to_completeopt = 1

" flake8
autocmd BufWritePost *.py call Flake8()

" open quickfix window after grep
autocmd QuickFixCmdPost *grep* cwindow

" " powerline tips and tricks
" set laststatus=2 " Always display the statusline in all windows
" set showtabline=2 " Always display the tabline, even if there is only one tab
" set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
" 
" python from powerline.vim import setup as powerline_setup
" python powerline_setup()
" python del powerline_setup


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

" tmux navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-W><C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-W><C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-W><C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-W><C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-W><C-w> :TmuxNavigatePrevious<cr>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vd :call VimuxSendText("exit()")<CR><BAR> :call VimuxSendKeys("Enter")<CR>
map <Leader>vi :call VimuxRunCommandInDir("ipython --pdb", 1)<CR>

" Jump to matching HTML tags with %
runtime macros/matchit.vim

" enable mouse
set mouse=a
