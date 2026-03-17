return {
	{
		"nvim-mini/mini.ai",
		event = { "BufReadPre", "BufAdd", "BufNewFile" },
		opts = {},
	},
	{
		"nvim-mini/mini.icons",
		opts = {
			style = "glyph",
			file = {
				-- README = { glyph = "󰆈", hl = "MiniIconsYellow" },
				-- ["README.md"] = { glyph = "󰆈", hl = "MiniIconsYellow" },
			},
			filetype = {
				bash = { glyph = "󱆃", hl = "MiniIconsGreen" },
				sh = { glyph = "󱆃", hl = "MiniIconsGrey" },
				-- 	toml = { glyph = "󱄽", hl = "MiniIconsOrange" },
			},
		},
	},
	{
		"nvim-mini/mini.diff",
		event = { "BufReadPre", "BufNewFile" },
		version = "*",
		-- keys = {
		--   {
		--     "<leader>to",
		--     function()
		--       require("mini.diff").toogle_overlay(vim.api.nvim_get_current_buf())
		--     end,
		--     mode = "n",
		--     desc = "Toggle diff overlay",
		--   },
		-- },
		opts = {
			mappings = {
				apply = "",
				reset = "",
				textobject = "",
				goto_first = "",
				goto_prev = "",
				goto_next = "",
				goto_last = "",
			},
		},
	},
}
