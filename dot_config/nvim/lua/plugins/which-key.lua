return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-mini/mini.icons" },
	opts = {
		preset = "modern",
		spec = {
			{ "<leader>f", group = "SnacksPicker", icon = "󰈞 " },
			{ "<leader>l", group = "Lspsaga", icon = "󰒋 " },
			{ "<leader>g", group = "Git", icon = " " },
			{ "<leader>c", group = "Cmake", icon = " " },
			{ "<leader>b", group = "Buffer", icon = " " },
			{ "<leader>t", group = "Terminal", icon = " " },
			{ "<leader>p", group = "Session", icon = " " },
			{ "<leader>x", group = "Trouble", icon = "󰦀 " },
			{ "<leader>d", group = "Debug", icon = " " },
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
