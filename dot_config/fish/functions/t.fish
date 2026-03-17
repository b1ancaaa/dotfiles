function t --wraps='tmux attach -t bianca || tmux new -s bianca' --description 'alias t=tmux attach -t bianca || tmux new -s bianca'
    tmux attach -t bianca || tmux new -s bianca $argv
end
