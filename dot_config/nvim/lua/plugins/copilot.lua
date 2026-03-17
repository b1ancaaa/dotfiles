return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "VeryLazy",
		opts = {
			suggestion = {
				enabled = true,
				auto_trigger = true,
			},
			panel = { enabled = false },
			filetypes = {
				markdown = true,
				help = true,
			},
		},
		keys = {
			{
				mode = { "i" },
				"<M-l>",
				function()
					require("copilot.suggestion").accept()
				end,
				desc = "Accept Copilot Suggestion",
			},
		},
	},
}
