let g:python3_host_prog='/home/ryo/.pyenv/shims/python'

call plug#begin('~/.vim/plugged')

Plug 'funorpain/vim-cpplint'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'itchyny/lightline.vim'

Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-commentary'
Plug 'janko-m/vim-test'
Plug 'chazy/dirsettings'

" python
Plug 'w0rp/ale'
Plug 'vim-scripts/indentpython.vim'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1
else
  Plug 'Valloric/YouCompleteMe'
  " Plug 'Shougo/deoplete.nvim'
  " Plug 'roxma/nvim-yarp'
  " Plug 'roxma/vim-hug-neovim-rpc'
endif

" misc languages
Plug 'leafgarland/typescript-vim'
Plug 'onerobotics/vim-karel'
Plug 'vim-latex/vim-latex'

Plug 'benmills/vimux'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
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
" let g:ycm_python_binary_path = '/home/ryo/.pyenv/shims/python'
nnoremap <leader>yg :YcmCompleter GoToDeclaration<CR>

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

" fzf
command! -bang -nargs=* GGrep call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, <bang>0)
nmap <C-p> :FZF<CR>
let $FZF_DEFAULT_COMMAND = 'ag -g "" -f --hidden --ignore ".git"'
let g:fzf_action = {
  \ 'ctrl-t': 'tab drop',
  \ 'ctrl-v': 'vsplit' }

" ale
let g:ale_linters = {
\   'python': ['mypy', 'flake8', 'isort'],
\}
let g:ale_fixers = {
\   'python': [
\       'isort', 'trim_whitespace', 'autopep8'
\   ],
\}


" vimux
map <Leader>vl :VimuxRunLastCommand<CR>

" vim-test
let test#strategy = "dispatch"

" yank ring
let g:yankring_replace_n_pkey = ''
let g:yankring_replace_n_nkey = ''
