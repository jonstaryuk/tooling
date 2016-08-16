local ret_status="%(?:%{$fg[blue]%}$:%{$fg[red]%}$)%{$reset_color%}"
PROMPT='%{$fg[blue]%}%n@%m %c$(git_prompt_info) ${ret_status} '

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[magenta]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[magenta]%}) %{$fg[yellow]%}•"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[magenta]%})"
