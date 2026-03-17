return {
	"kevinhwang91/nvim-ufo",
	dependencies = { "kevinhwang91/promise-async" },
	event = "BufReadPost",
	opts = {
		provider_selector = function(_, _, _)
			return { "treesitter", "indent" }
		end,
	},
	config = function(_, opts)
		vim.o.foldcolumn = "1"
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		vim.opt.fillchars = {
			fold = " ",
			foldopen = "",
			foldclose = "",
			foldsep = " ",
			eob = " ", -- 确认这一行闭合正确
		}

		require("ufo").setup(opts)
	end,
}
