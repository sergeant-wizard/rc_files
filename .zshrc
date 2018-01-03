export TERM="xterm-256color"

# load zgen
source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then
    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/zsh-dircolors-solarized

    zgen load zsh-users/zsh-syntax-highlighting
    zgen load bhilburn/powerlevel9k powerlevel9k
    zgen load willghatch/zsh-saneopt

    # completions
    zgen load zsh-users/zsh-completions src

    # save all to init script
    zgen save
fi

export POWERLEVEL9K_MODE='nerdfont-complete'

HYPHEN_INSENSITIVE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

eval `keychain --eval id_rsa_0424 id_rsa_0424`

# Z
. ~/z/z.sh

alias putclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'

export EDITOR=vim
export VISUAL=vim

alias vim=/home/ryo/vim/bin/vim

if [[ -a ~/.zshrc.local ]]; then
    . ~/.zshrc.local
fi
