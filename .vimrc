if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'gmarik/Vundle.vim'
Plug 'funorpain/vim-cpplint'
" Plug 'ctrlpvim/ctrlp.vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-commentary'

" python
Plug 'vim-scripts/indentpython.vim'
Plug 'hdima/python-syntax'
Plug 'nvie/vim-flake8'
Plug 'Valloric/YouCompleteMe'

" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif
" Plug 'zchee/deoplete-jedi'
" let g:deoplete#enable_at_startup = 1

" misc languages
Plug 'onerobotics/vim-karel'
Plug 'vim-latex/vim-latex'

" tmux
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

" ctrlp options
" let g:ctrlp_custom_ignore = 'node_modules'
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']
" let g:ctrlp_extensions = ['tag', 'dir']
" let g:ctrlp_types = ['fil', 'mru', 'tag']


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

set foldlevelstart=20

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" make background transparent
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE

command! -bang -nargs=* GGrep call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, <bang>0)
map <C-p> :FZF<CR>
