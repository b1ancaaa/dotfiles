return {
	{
		-- enabled = false,
		"kawre/leetcode.nvim",
		cmd = { "Leet" },
		build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
		dependencies = {
			"folke/snacks.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-treesitter/nvim-treesitter",
			-- "3rd/image.nvim",
		},
		opts = {
			lang = "cpp",
			cn = {
				enabled = true,
			},
			picker = { provider = "snacks-picker" },
			injector = {
				["cpp"] = {
					imports = function()
						return {
							"#include <bits/stdc++.h>",
							"using namespace std;",
						}
					end,
				},
			},

			-- image_support = true,
		},
	},
}
