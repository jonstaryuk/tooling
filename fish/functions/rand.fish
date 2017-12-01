function rand
    head -c $argv[1] /dev/random | base64 | tr '+/' '-_' | tr -d '='
end
