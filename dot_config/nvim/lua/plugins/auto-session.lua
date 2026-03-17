return {
	"rmagatti/auto-session",
	-- lazy = false,
	opts = {
		auto_restore = false,
		suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
		session_lens = {
			picker = "snacks",
			load_on_setup = false,
		},
	},
	keys = {
		{ "<leader>ps", ":AutoSession save<CR>", desc = "Save Session" },
		{ "<leader>pr", ":AutoSession restore<CR>", desc = "Restore Session" },
		{ "<leader>pS", ":AutoSession search<CR>", desc = "Search Session" },
		{ "<leader>pD", ":AutoSession delete<CR>", desc = "Delete Session" },
	},

	init = function()
		vim.o.sessionoptions = "buffers,curdir,tabpages,winsize,help,globals,blank,folds,winpos,terminal,localoptions"
	end,
}
