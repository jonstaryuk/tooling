### Colors! ####################################################################

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
alias trec="tree -C"

### Aliases ####################################################################

alias abuse='querycontacts' # Query DNS abuse contact email addresses by IP
alias chrome='open -a "Google Chrome.app"' # Open a file in Chrome
alias gs='git status'
alias ga='git add'
alias gk='git checkout'
alias gd='git diff'
alias hlog='heroku logs -a'
alias ll='ls -lah' # Long listing
alias random='openssl rand -base64'
alias rand='random'

### Misc #######################################################################

# Private mode
alias private='unset HISTFILE && echo -e "\033[1m[\033[0m\033[4m*\033[0m\033[1m] \033[0m\033[4mprivate mode activated.\033[0m"'

# Sensitive environment variables
source '/Users/jonathan/.env_secrets'

# Settings not publicly posted
source '/Users/jonathan/.bash_profile_secret'

# Colorful manpages
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

# nvm
export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

# rbenv shims
eval "$(rbenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
source '/Users/jonathan/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
# source '/Users/jonathan/google-cloud-sdk/completion.bash.inc'

### Git information in prompt ##################################################

# from https://github.com/jimeh/git-aware-prompt

find_git_branch() {
  # Based on: http://stackoverflow.com/a/13003854/170413
  local branch
  if branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); then
    if [[ "$branch" == "HEAD" ]]; then
      branch='detached*'
    fi
    git_branch=" ($branch)"
  else
    git_branch=""
  fi
}

find_git_dirty() {
  local status=$(git status --porcelain 2> /dev/null)
  if [[ "$status" != "" ]]; then
    git_dirty=' *'
  else
    git_dirty=''
  fi
}

PROMPT_COMMAND="find_git_branch; find_git_dirty; $PROMPT_COMMAND"

# Default Git enabled prompt with dirty state
txtblu="$(tput setaf 4 2>/dev/null || echo '\e[0;34m')"  # Blue
txtpur="$(tput setaf 5 2>/dev/null || echo '\e[0;35m')"  # Purple
txtylw="$(tput setaf 3 2>/dev/null || echo '\e[0;33m')"  # Yellow
txtrst="$(tput sgr 0 2>/dev/null || echo '\e[0m')"  # Text Reset
export PS1="\[$txtblu\]\u@\h \W\[$txtpur\]\$git_branch\[$txtylw\]\$git_dirty\[$txtblu\] \$ \[$txtrst\]"

# Default Git enabled root prompt (for use with "sudo -s")
bakred="$(tput setab 1 2>/dev/null || echo '\e[41m')"  # Red
export SUDO_PS1="\[$bakred\]\u@\h\[$txtrst\] \W \$ "
