alias chrome='open -a "Google Chrome.app"' # Open a file in Chrome
alias random='openssl rand -base64'
alias rand='random'

source '/Users/jon/Applications/google-cloud-sdk/path.zsh.inc'
source '/Users/jon/Applications/google-cloud-sdk/completion.zsh.inc'

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

export PATH=$PATH:/Users/jon/code/go/bin

function share() {
    filepath=$1

    key=$(head -c 18 /dev/random | base64 | tr "+/" "-_" | tr -d "=")
    urn="$SHARE_DOMAIN/$key"

    gsutil cp -n \
        -z "c,css,csv,go,html,js,json,md,py,sh,txt,yaml" \
        $filepath gs://$urn

    if [ $? -eq 0 ]
    then
        echo -n "http://$urn" | pbcopy
        echo "▸ $urn"
    else
        return 1
    fi
}
