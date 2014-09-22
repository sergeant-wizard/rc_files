set_prompt() {
  local face
  face=$1
  if [ "$SSH_CLIENT" ]; then
    PROMPT="%{%(?.$fg[cyan].$fg[red])%}$face%{$reset_color%}%b $PROMPT"
  else
    PROMPT="%{%(?.$fg[cyan].$fg[red])%}$face%{$reset_color%}%b $PROMPT"
  fi
}

local ret_status="%(?:%{$fg_bold[green]%}->:%{$fg_bold[red]%}->%s)"
PROMPT='%T ${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%~ %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}
->'
set_prompt "%(?.(▰╹◡╹%).ヾ(｡>﹏<｡%)ﾉﾞ)"


ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

export LESSCHARSET=utf-8

setopt NO_cdable_vars
