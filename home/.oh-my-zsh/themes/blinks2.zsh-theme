# https://github.com/blinks zsh theme

function _prompt_char() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    echo "%{%F{blue}%}±%{%f%k%b%}"
  else
    echo ' '
  fi
}

ZSH_THEME_GIT_PROMPT_PREFIX=" [%{%B%F{blue}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%k%b%K{black}%B%F{green}%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{red}%}*%{%f%k%b%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%{%f%k%b%}
%{%b%F{yellow}%K{black}%}$(rvm-prompt u g)%{%B%F{green}%} %{%b%F{blue}%K{black}%}%~%{%B%F{green}%}$(git_prompt_info)%E%{%f%k%b%}
%{%K{black}%}$(_prompt_char)%{%K{black}%} %# %{%f%k%b%} '

RPROMPT='%{%b%F{cyan}%K{black}%} !%{%B%F{cyan}%}%! %{%f%k%b%}'

function zle-line-init zle-keymap-select {
  RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/}"
  RPROMPT='%{%b%F{cyan}%K{black}%} '$RPS1' !%{%B%F{cyan}%}%! %{%f%k%b%}'
  RPS2=$RPROMPT
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

