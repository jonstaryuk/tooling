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

    gsutil cp -n \
        -z "c,css,csv,go,html,js,json,md,py,sh,txt,yaml" \
        $filepath gs://$SHARE_BUCKET/$key

    if [ $? -eq 0 ]
    then
        echo -n "https://$SHARE_BUCKET.storage.googleapis.com/$key" | pbcopy
        echo "URL copied"
    else
        return 1
    fi
}

function optimizePdf() {
    filepath=$1

    \gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 \
        -dPDFSETTINGS=/ebook -dNumRenderingThreads=4 \
        -dBandBufferSpace=500000000 -dBufferSpace=1000000000 \
        -sOutputFile="${1%.pdf}.opt.pdf" \
        -c "1000000000 setvmthreshold" -f "$1"
}
