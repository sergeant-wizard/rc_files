set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

let g:python_host_prog = '/home/ryo/.pyenv/shims/python2'
let g:python3_host_prog = '/home/ryo/.pyenv/shims/python3'

source ~/.vimrc
tnoremap <Esc> <C-\><C-n>
