# Defined in - @ line 2
function share
	set file $argv[1]
    set ext (echo $file | sed 's/.*\.//')
    set newname (rand 16).$ext

    set COMPRESSIBLE html,css,js,txt,md,csv,c,cpp,h,go,py,json,yaml,svg
    gsutil cp -n -z $COMPRESSIBLE $file gs://$SHARE_BUCKET/$newname

    set url https://$SHARE_HOSTNAME/$newname
    echo $url
    echo -n $url | pbcopy
end
