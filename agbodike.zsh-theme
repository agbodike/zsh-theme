function prompt_char {
  git branch >/dev/null 2>/dev/null && echo '±' && return
  hg root >/dev/null 2>/dev/null && echo '☿' && return
  echo '○'
}
function git_initials {
  echo "$(git config --get user.initials)"
}
function ruby_version()
{
  if which rbenv &> /dev/null; then
    rbenv version | sed -e "s/ (set.*$//"
  else
    if which rvm-prompt &> /dev/null; then
      rvm-prompt i v g
    fi
  fi
}

PROMPT='%{$fg[cyan]%}%~%{$reset_color%}
%{$fg[cyan]%}$(prompt_char)%{$fg[red]%}|%{$fg[green]%}$(git_initials)%{$fg[red]%}|%{$reset_color%}$(git_prompt_info)%{$fg[cyan]%}⇒%{$reset_color%}  '
RPROMPT='%{$fg[yellow]%}$(ruby_version)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ✗ "
ZSH_THEME_GIT_PROMPT_CLEAN=" ✓ "
