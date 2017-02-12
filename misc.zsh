alias chrome='open -a "Google Chrome.app"' # Open a file in Chrome
alias random='openssl rand -base64'
alias rand='random'

source '/Users/jon/Applications/google-cloud-sdk/path.zsh.inc'
source '/Users/jon/Applications/google-cloud-sdk/completion.zsh.inc'

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

export PATH=$PATH:/Users/jon/code/go/bin

