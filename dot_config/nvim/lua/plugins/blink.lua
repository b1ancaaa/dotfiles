return {
	"saghen/blink.cmp",
	version = "1.*",
	enabled = not vim.g.vscode,
	dependencies = {
		-- "rafamadriz/friendly-snippets",
		{ "xzbdmw/colorful-menu.nvim", opts = {} },
		-- "fang2hou/blink-copilot",
	},
	event = { "BufReadPre", "BufNewFile", "CmdlineEnter" },
	opts = {
		appearance = {
			nerd_font_variant = "mono",
		},
		completion = {
			documentation = {
				auto_show = true,
				window = {
					border = "rounded",
					scrollbar = false,
				},
			},
			menu = {
				border = "rounded",
				auto_show = true,
				auto_show_delay_ms = 0,
				scrollbar = false,
				draw = {
					columns = { { "kind_icon" }, { "label", gap = 1 } },
					components = {
						label = {
							text = function(ctx)
								return require("colorful-menu").blink_components_text(ctx)
							end,
							highlight = function(ctx)
								return require("colorful-menu").blink_components_highlight(ctx)
							end,
						},
					},
				},
			},
		},
		keymap = {
			preset = "super-tab",
			["<C-y>"] = { "select_and_accept" },
			["<C-u>"] = { "scroll_documentation_up", "fallback" },
			["<C-d>"] = { "scroll_documentation_down", "fallback" },
		},
		signature = {
			enabled = true,
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer", "lazydev" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
				-- copilot = {
				-- 	name = "copilot",
				-- 	module = "blink-copilot",
				-- 	score_offset = 100,
				-- 	async = true,
				-- 	opts = {
				-- 		kind_hl = "BlinkCmpKindCopilot",
				-- 	},
				-- },
				snippets = { score_offset = 100 },
			},
		},
		cmdline = {
			enabled = true,
			sources = function()
				local type = vim.fn.getcmdtype()
				if type == "/" or type == "?" then
					return { "buffer" }
				end
				if type == ":" then
					return { "cmdline" }
				end
				if type == "@" then
					return { "path" }
				end
				return { "path" }
			end,
			keymap = {
				preset = "cmdline",
				["<C-y>"] = { "select_and_accept" },
				["<Tab>"] = { "select_and_accept", "fallback" },
			},
			completion = {
				menu = {
					auto_show = true,
				},
			},
		},
	},
}
