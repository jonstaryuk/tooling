### Colors! ####################################################################

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
alias trec="tree -C"

# Less (and manpages)
export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode - red
export LESS_TERMCAP_md=$(printf '\e[01;34m') # enter double-bright mode - bold, blue
export LESS_TERMCAP_me=$(printf '\e[0m') # turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_se=$(printf '\e[0m') # leave standout mode
export LESS_TERMCAP_so=$(printf '\e[01;93m') # enter standout mode - light yellow
export LESS_TERMCAP_ue=$(printf '\e[0m') # leave underline mode
export LESS_TERMCAP_us=$(printf '\e[04;32m') # enter underline mode - green

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

# Include other files
include () {
  [[ -f "$1" ]] && source "$1"
}

# Settings not publicly posted
include '/Users/jonathan/.env_secrets'
include '/Users/jonathan/.bash_profile_secret'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Google Cloud SDK
include '/Users/jonathan/google-cloud-sdk/path.bash.inc'

# Shell command completion for gcloud.
# include '/Users/jonathan/google-cloud-sdk/completion.bash.inc'

### Prompt #####################################################################

function _prompt_command() {
  # Get last exit code (must come first)
  local EXIT="$?"

  # Color shortcuts
  local txtred="$(tput setaf 1 2>/dev/null || echo '\e[0;31m')"  # Red
  local txtblu="$(tput setaf 4 2>/dev/null || echo '\e[0;34m')"  # Blue
  local txtpur="$(tput setaf 5 2>/dev/null || echo '\e[0;35m')"  # Purple
  local txtylw="$(tput setaf 3 2>/dev/null || echo '\e[0;33m')"  # Yellow
  local txtrst="$(tput sgr 0 2>/dev/null || echo '\e[0m')"  # Text Reset

  # Color the prompt character based on last exit code
  if [ $EXIT != 0 ]; then
    local prompt_char="$txtred\$"
  else
    local prompt_char="$txtblu\$"
  fi

  # Add user, host, and current directory name
  PS1="$txtblu\u@\h \W "

  # Find git branch
  # Via https://github.com/jimeh/git-aware-prompt
  # Based on http://stackoverflow.com/a/13003854/170413
  local branch
  PS1+="$txtpur"
  if branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); then
    if [[ "$branch" == "HEAD" ]]; then
      branch="detached"
    fi
    PS1+="($branch)"

    # Find git dirty state
    local status=$(git status --porcelain 2> /dev/null)
    if [[ "$status" != "" ]]; then
      PS1+="$txtylw • $txtblu"
    else
      PS1+=" "
    fi
  fi
  PS1+="$txtblu"

  # Append prompt char, space, and reset text color
  PS1+="$prompt_char $txtrst"
}

export PROMPT_COMMAND=_prompt_command

# Default Git enabled root prompt (for use with "sudo -s")
bakred="$(tput setab 1 2>/dev/null || echo '\e[41m')"  # Red background
txtrst="$(tput sgr 0 2>/dev/null || echo '\e[0m')"  # Text Reset
export SUDO_PS1="\[$bakred\]\u@\h \W\[$txtrst\] \$ "
