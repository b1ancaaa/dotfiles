return {
	"nvim-treesitter/nvim-treesitter",
	event = "BufReadPre",
	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter-context",
			opts = {
				separator = nil,
				max_lines = 5,
				multiwindow = true,
				min_window_height = 15,
			},
		},
	},
	main = "nvim-treesitter.configs",
	branch = "main",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"lua",
			"toml",
			"html",
			"c",
			"cpp",
			"cmake",
			"vim",
			"vimdoc",
			"query",
			"markdown",
			"markdown_inline",
			"regex",
		},
		ignore_install = {
			"yaml",
			"xml",
			"latex",
		},
		auto_install = true,
		highlight = {
			enable = true,
			disable = {
				"latex",
			},
		},
		disable = function(lang, bufnr)
			return lang == "yaml" and vim.api.nvim_buf_line_count(bufnr) > 5000
		end,
		sycn_install = true,
		indent = { enable = true },
	},

	config = function(_, opts)
		-- vim.api.nvim_set_hl(0, "TreesitterContext", { link = "CursorLine" }) -- remove existing link
		-- vim.api.nvim_set_hl(0, "TreesitterContextBottom", {
		-- 	underline = true,
		-- 	sp = "#b4befe",
		-- })
	end,
}
