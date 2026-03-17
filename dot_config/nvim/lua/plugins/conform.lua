return {
	"stevearc/conform.nvim",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			cpp = { "clang-format" },
			cmake = { "cmake_format" },
			rust = { "rustfmt" },
			python = { "ruff" },

			["_"] = { "trim_whitespace" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
	keys = {
		{
			"<leader>lf",
			mode = { "n", "v" },
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			desc = "Format",
		},
	},
}
