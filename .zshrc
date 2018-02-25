export ZSH_THEME="powerlevel9k/powerlevel9k"
export TERM="xterm-256color"

POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir virtualenv vcs newline)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs)

zstyle :omz:plugins:ssh-agent identities id_rsa_0424

source ${HOME}/antigen.zsh

antigen use oh-my-zsh
antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle colorize
antigen bundle compleat
antigen bundle clipboard
antigen bundle docker
antigen bundle python
antigen bundle pylint
antigen bundle ssh-agent

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle joel-porquet/zsh-dircolors-solarized.git
antigen bundle andrewferrier/fzf-z

antigen theme bhilburn/powerlevel9k powerlevel9k
antigen apply

HYPHEN_INSENSITIVE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

export EDITOR=vim
export VISUAL=vim

alias ls='ls --color=auto'

if [[ -a ~/.zshrc.local ]]; then
    . ~/.zshrc.local
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
