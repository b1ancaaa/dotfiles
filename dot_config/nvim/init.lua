require("config.options")
require("config.lazy")
require("config.keymaps")
require("config.lsp")
require("config.autocmds")

if vim.g.neovide then
	vim.o.guifont = "Maple Mono NF CN:h14"
	vim.g.neovide_opacity = 1
	-- vim.g.neovide_normal_opacity = 0.8
	vim.g.neovide_window_blurred = true
	vim.opt.termguicolors = true
	-- vim.g.neovide_fullscreen = true

	vim.g.neovide_refresh_rate = 165
	vim.g.neovide_refresh_rate_idle = 5
end
