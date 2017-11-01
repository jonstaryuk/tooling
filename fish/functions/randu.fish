function randu
    rand $argv[1] | tr -d '=' | tr '+/' '-_'
end
