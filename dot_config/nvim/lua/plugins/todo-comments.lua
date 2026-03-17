return {
	"folke/todo-comments.nvim",
	event = { "VeryLazy" },
	opts = {
		signs = false,
	},
	keys = {
		{
			mode = { "n" },
			"]t",
			function()
				require("todo-comments").jump_next()
			end,
			desc = "Next Todo Comment",
		},
		{
			mode = { "n" },
			"[t",
			function()
				require("todo-comments").jump_prev()
			end,
			desc = "Previous Todo Comment",
		},
	},
}
