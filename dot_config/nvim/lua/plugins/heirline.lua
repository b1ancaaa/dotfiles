return {
	"rebelot/heirline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"linrongbin16/lsp-progress.nvim",
	},
	config = function()
		require("lsp-progress").setup()
		require("heirline").setup({
			statusline = require("config.heirline.statusline"),
		})
	end,
}
