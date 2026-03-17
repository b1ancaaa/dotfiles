function svim --wraps='sudo -E vim' --description 'alias svim=sudo -E vim'
    sudo -E vim $argv
end
