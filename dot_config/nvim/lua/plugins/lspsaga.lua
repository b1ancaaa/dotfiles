return {
	"nvimdev/lspsaga.nvim",
	cmd = "Lspsaga",
	opts = {
		finder = {
			keys = {
				toggle_or_open = "<CR>",
			},
		},
		hover = {
			open_link = "gx",
			render_markdown = true,
		},
		ui = {
			kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
		},
	},
	keys = {
		{ "<leader>lr", ":Lspsaga rename<CR>", desc = "LSP Rename" },
		{ "<leader>lc", ":Lspsaga code_action<CR>", desc = "LSP Code Action" },
		{ "<leader>ld", ":Lspsaga goto_definition<CR>", desc = "LSP Go to Definition" },
		{ "<leader>lh", ":Lspsaga hover_doc<CR>", desc = "LSP Hover Documentation" },
		{ "<leader>ls", ":Lspsaga signature_help<CR>", desc = "LSP Signature Help" },
		{ "<leader>lR", ":Lspsaga finder<CR>", desc = "LSP References" },
		{ "<leader>ln", ":Lspsaga diagnostic_jump_next<CR>", desc = "LSP Next Diagnostic" },
		{ "<leader>lp", ":Lspsaga diagnostic_jump_prev<CR>", desc = "LSP Previous Diagnostic" },
	},
}
