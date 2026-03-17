return {
	"akinsho/bufferline.nvim",
	lazy = true,
	event = { "BufReadPre", "BufAdd", "BufNewFile" },
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		options = {
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(_, _, diagnostics_dict, _)
				local indicator = " "
				for level, number in pairs(diagnostics_dict) do
					local symbol
					if level == "error" then
						symbol = " "
					elseif level == "warning" then
						symbol = " "
					else
						symbol = " "
					end
					indicator = indicator .. number .. symbol
				end
				return indicator
			end,
			-- 过滤掉特殊类型的 buffer，不在 bufferline 中显示
			custom_filter = function(buf_number)
				local buftype = vim.bo[buf_number].buftype
				local filetype = vim.bo[buf_number].filetype
				-- 过滤掉这些特殊类型
				local exclude_ft = {
					"lspinfo",
					"mason",
					"lazy",
					"help",
					"checkhealth",
					"qf",
					"query",
				}
				for _, ft in ipairs(exclude_ft) do
					if filetype == ft then
						return false
					end
				end
				-- 过滤掉特殊的 buftype
				if buftype == "quickfix" or buftype == "help" then
					return false
				end
				return true
			end,
		},
	},
	keys = {
		{ "<leader>bh", ":BufferLineCyclePrev<CR>", silent = true },
		{ "<leader>bl", ":BufferLineCycleNext<CR>", silent = true },
		{ "<leader>bp", ":BufferLinePick<CR>", silent = true },
		{ "<leader>bd", ":bdelete<CR>", silent = true },
	},
	configs = function(_, opts)
		if (vim.g.colors_name or ""):find("catppuccin") then
			opts.highlights = require("catppuccin.special.bufferline").get_theme()
		end
	end,
	enabled = false,
}
