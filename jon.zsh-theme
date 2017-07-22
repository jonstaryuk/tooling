PROMPT='%{$fg[blue]%}%n@%m %c$(git_prompt_info) %{$reset_color%}$ '

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[magenta]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[magenta]%}) %{$fg[yellow]%}•"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[magenta]%})"

# Less (and manpages)
export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode - red
export LESS_TERMCAP_md=$(printf '\e[01;34m') # enter double-bright mode - bold, blue
export LESS_TERMCAP_me=$(printf '\e[0m') # turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_se=$(printf '\e[0m') # leave standout mode
export LESS_TERMCAP_so=$(printf '\e[01;93m') # enter standout mode - light yellow
export LESS_TERMCAP_ue=$(printf '\e[0m') # leave underline mode
export LESS_TERMCAP_us=$(printf '\e[04;32m') # enter underline mode - green
