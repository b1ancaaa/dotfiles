return {
	"mason-org/mason-lspconfig.nvim",
	event = "VeryLazy",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {
			ui = {
				border = "rounded",
			},
		} },
		"neovim/nvim-lspconfig",
	},

	opts = {
		ensure_installed = {
			"clangd",
			"lua_ls",
			"rust_analyzer",
			"neocmake",
			"basedpyright",
			"gopls",
			"ruff",
			"stylua",
		},
	},
}
