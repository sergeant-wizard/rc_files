# Path to your oh-my-zsh installation.
export ZSH=/home/ryo/.oh-my-zsh
export ZSH_THEME="powerlevel9k/powerlevel9k"
export TERM="xterm-256color"

POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir virtualenv vcs newline)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs)

source ${HOME}/antigen.zsh

antigen bundle git
antigen bundle pip
antigen bundle command-not-found

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

antigen theme bhilburn/powerlevel9k powerlevel9k
antigen apply

HYPHEN_INSENSITIVE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

eval `keychain --eval id_rsa_0424 id_rsa_0424`

# Z
. ~/z/z.sh

# color ls
eval `dircolors /home/ryo/dircolors-solarized/dircolors.256dark`

alias putclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'

export EDITOR=vim
export VISUAL=vim

alias vim=/home/ryo/vim/bin/vim

if [[ -a ~/.zshrc.local ]]; then
    . ~/.zshrc.local
fi
