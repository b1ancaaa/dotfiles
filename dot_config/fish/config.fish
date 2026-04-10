source /usr/share/cachyos-fish-config/cachyos-config.fish

zoxide init fish | source
mise activate fish | source
starship init fish | source

set -gx EDITOR nvim

fish_add_path $HOME/.local/share/nvim/mason/bin

fzf_configure_bindings --directory=\ct


set -g fish_cursor_default block
set -g fish_cursor_insert block
set -g fish_cursor_replace_one underscore
set -g fish_cursor_visual block

set -Ux CLAUDE_CODE_DISABLE_EXPERIMENTAL_BETAS 1
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end
