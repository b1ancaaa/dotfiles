function td --wraps='tmux kill-session $argv' --wraps='tmux kill-session' --wraps='tmux kill-session -t' --wraps='tmux kill-session -t $argv' --description 'alias td=tmux kill-session -t'
    tmux kill-session -t $argv
end
