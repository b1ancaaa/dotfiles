return {
	"folke/snacks.nvim",
	enabled = not vim.g.vscode,
	priority = 1000,
	lazy = false,
	opts = {
		notifier = { enabled = true },
		terminal = {
			win = {
				style = "terminal",
				position = "float",
				border = "rounded",
				width = 0.8,
				height = 0.8,
			},
		},
		win = { style = "terminal" },
		picker = {
			matcher = { frecency = true, cwd_bonus = true, history_bonus = true },
			formatters = { icon_width = 3 },
			win = {
				input = {
					keys = {
						["<C-t"] = { "edit_tab", mode = { "n", "i" } },
					},
				},
			},
		},
		input = {
			enabled = true,
			icon = " ",
			icon_hl = "SnacksInputIcon",
			icon_pos = "left",
			prompt_pos = "title",
			win = { style = "input" },
			expand = true,
		},
		dashboard = {
			enabled = true,
			preset = {
				keys = {
					{ icon = "󰈞 ", key = "f", desc = "Find files", action = ":lua Snacks.picker.smart()" },
					{ icon = " ", key = "e", desc = "New file", action = ":enew" },
					{ icon = " ", key = "o", desc = "Recent files", action = ":lua Snacks.picker.recent()" },
					{
						icon = "󰒲 ",
						key = "L",
						desc = "Lazy",
						action = ":Lazy",
						enabled = package.loaded.lazy ~= nil,
					},
					{
						icon = "󰔛 ",
						key = "P",
						desc = "Lazy Profile",
						action = ":Lazy profile",
						enabled = package.loaded.lazy ~= nil,
					},
					{
						icon = " ",
						key = "M",
						desc = "Mason",
						action = ":Mason",
						enabled = package.loaded.lazy ~= nil,
					},
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},

				-- ░  ░░░░░░░░  ░░░░  ░░░      ░░░  ░░░░░░░
				-- ▒  ▒▒▒▒▒▒▒▒  ▒▒▒▒  ▒▒  ▒▒▒▒  ▒▒  ▒▒▒▒▒▒▒
				-- ▓  ▓▓▓▓▓▓▓▓        ▓▓  ▓▓▓▓▓▓▓▓       ▓▓
				-- █  ████████  ████  ██  ████  ██  ████  █
				-- █        ██  ████  ███      ███       ██
				header = [[
	⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
	⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⣠⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
	⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣡⣾⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣟⠻⣿⣿⣿⣿⣿⣿⣿⣿
	⣿⣿⣿⣿⣿⣿⣿⣿⡿⢫⣷⣿⣿⣿⣿⣿⣿⣿⣾⣯⣿⡿⢧⡚⢷⣌⣽⣿⣿⣿⣿⣿⣶⡌⣿⣿⣿⣿⣿⣿
	⣿⣿⣿⣿⣿⣿⣿⣿⠇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣮⣇⣘⠿⢹⣿⣿⣿⣿⣿⣻⢿⣿⣿⣿⣿⣿
	⣿⣿⣿⣿⣿⣿⣿⣿⠀⢸⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⡟⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣻⣿⣿⣿⣿
	⣿⣿⣿⣿⣿⣿⣿⡇⠀⣬⠏⣿⡇⢻⣿⣿⣿⣿⣿⣿⣿⣷⣼⣿⣿⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⢻⣿⣿⣿⣿
	⣿⣿⣿⣿⣿⣿⣿⠀⠈⠁⠀⣿⡇⠘⡟⣿⣿⣿⣿⣿⣿⣿⣿⡏⠿⣿⣟⣿⣿⣿⣿⣿⣿⣿⣿⣇⣿⣿⣿⣿
	⣿⣿⣿⣿⣿⣿⡏⠀⠀⠐⠀⢻⣇⠀⠀⠹⣿⣿⣿⣿⣿⣿⣩⡶⠼⠟⠻⠞⣿⡈⠻⣟⢻⣿⣿⣿⣿⣿⣿⣿
	⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⢿⠀⡆⠀⠘⢿⢻⡿⣿⣧⣷⢣⣶⡃⢀⣾⡆⡋⣧⠙⢿⣿⣿⣟⣿⣿⣿⣿
	⣿⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⡥⠂⡐⠀⠁⠑⣾⣿⣿⣾⣿⣿⣿⡿⣷⣷⣿⣧⣾⣿⣿⣿⣿⣿⣿⣿
	⣿⣿⡿⣿⣍⡴⠆⠀⠀⠀⠀⠀⠀⠀⠀⣼⣄⣀⣷⡄⣙⢿⣿⣿⣿⣿⣯⣶⣿⣿⢟⣾⣿⣿⢡⣿⣿⣿⣿⣿
	⣿⡏⣾⣿⣿⣿⣷⣦⠀⠀⠀⢀⡀⠀⠀⠠⣭⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⣡⣾⣿⣿⢏⣾⣿⣿⣿⣿⣿
	⣿⣿⣿⣿⣿⣿⣿⣿⡴⠀⠀⠀⠀⠀⠠⠀⠰⣿⣿⣿⣷⣿⠿⠿⣿⣿⣭⡶⣫⠔⢻⢿⢇⣾⣿⣿⣿⣿⣿⣿
	⣿⣿⣿⡿⢫⣽⠟⣋⠀⠀⠀⠀⣶⣦⠀⠀⠀⠈⠻⣿⣿⣿⣾⣿⣿⣿⣿⡿⣣⣿⣿⢸⣾⣿⣿⣿⣿⣿⣿⣿
	⡿⠛⣹⣶⣶⣶⣾⣿⣷⣦⣤⣤⣀⣀⠀⠀⠀⠀⠀⠀⠉⠛⠻⢿⣿⡿⠫⠾⠿⠋⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
	⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣀⡆⣠⢀⣴⣏⡀⠀⠀⠀⠉⠀⠀⢀⣠⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
	⠿⠛⠛⠛⠛⠛⠛⠻⢿⣿⣿⣿⣿⣯⣟⠷⢷⣿⡿⠋⠀⠀⠀⠀⣵⡀⢠⡿⠋⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
	⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⢿⣿⣿⠂⠀⠀⠀⠀⠀⢀⣽⣿⣿⣿⣿⣿⣿⣿⣍⠛⠿⣿⣿⣿⣿⣿⣿
]],
			},
			sections = {
				{ section = "header" },
				{ section = "keys", indent = 2, padding = 1 },
				{ section = "startup", padding = 1 },
			},
		},
		image = {
			enabled = true,
			doc = { enabled = true, inline = false, float = true, max_width = 80, max_height = 20 },
		},
		indent = {
			enabled = true,
			char = "│",
			indent = { enabled = true },
			animate = {
				enabled = false,
				duration = {
					step = 10,
					duration = 100,
				},
			},
			scope = {
				enabled = true,
				char = "┃",
				underline = false,
				only_current = true,
				priority = 1000,
			},
		},
		styles = {
			snacks_image = {
				border = "rounded",
				backdrop = true,
			},
		},
	},
	config = function(_, opts)
		require("snacks").setup(opts)

		local map = function(key, func, desc)
			vim.keymap.set("n", key, func, { desc = desc })
		end

		map("<leader>ff", Snacks.picker.smart, "Smart find file")
		map("<leader>fo", Snacks.picker.recent, "Find recent file")
		map("<leader>fw", Snacks.picker.grep, "Find content")
		map("<leader>fp", Snacks.picker.grep_buffers, "Find buffer content")
		map("<leader>fh", function()
			Snacks.picker.help({ layout = "dropdown" })
		end, "Find in help")
		map("<leader>fl", Snacks.picker.picker_layouts, "Find picker layout")
		map("<leader>fk", function()
			Snacks.picker.keymaps({ layout = "dropdown" })
		end, "Find keymap")
		map("<leader><leader>", function()
			Snacks.picker.buffers({ sort_lastused = true })
		end, "Find buffers")
		map("<leader>fm", Snacks.picker.marks, "Find mark")
		map("<leader>fn", function()
			Snacks.picker.notifications({ layout = "dropdown" })
		end, "Find notification")
		-- map("grr", function()
		-- 	Snacks.picker.lsp_references({ include_declaration = false, include_current = true })
		-- end, "Find lsp references")
		map("<leader>fS", Snacks.picker.lsp_workspace_symbols, "Find workspace symbol")
		map("<leader>fs", function()
			local bufnr = vim.api.nvim_get_current_buf()
			local clients = vim.lsp.get_clients({ bufnr = bufnr })

			local function has_lsp_symbols()
				for _, client in ipairs(clients) do
					if client.server_capabilities.documentSymbolProvider then
						return true
					end
				end
				return false
			end

			if has_lsp_symbols() then
				Snacks.picker.lsp_symbols({
					layout = "dropdown",
					tree = true,
					-- filter = {
					--     default = {
					--         "Function",
					--         "Method",
					--         "Class",
					--     }
					-- }
				})
			else
				Snacks.picker.treesitter()
			end
		end, "Find symbol in current buffer")
		map("<leader>fi", Snacks.picker.icons, "Find icon")
		map("<leader>fI", Snacks.picker.lsp_incoming_calls, "Find incoming calls")
		map("<leader>fO", function()
			Snacks.picker.lsp_outgoing_calls({ tree = true })
		end, "Find outgoing calls")
		map("<leader>fT", Snacks.picker.lsp_type_definitions, "Find type definitions")
		map("<leader>fb", Snacks.picker.lines, "Find lines in current buffer")
		map("<leader>fd", Snacks.picker.diagnostics_buffer, "Find diagnostic in current buffer")
		map("<leader>fH", Snacks.picker.highlights, "Find highlight")
		map("<leader>fc", function()
			Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
		end, "Find nvim config file")
		map("<leader>f/", Snacks.picker.search_history, "Find search history")
		map("<leader>fj", Snacks.picker.jumps, "Find jump")
		map("<leader>ftT", function()
			if vim.bo.filetype == "markdown" then
				Snacks.picker.grep_buffers({
					finder = "grep",
					format = "file",
					prompt = " ",
					search = "^\\s*- \\[ \\]",
					regex = true,
					live = false,
					args = { "--no-ignore" },
					on_show = function()
						vim.cmd.stopinsert()
					end,
					buffers = false,
					supports_live = false,
					layout = "ivy",
				})
			else
				Snacks.picker.todo_comments({
					keywords = { "TODO", "FIX", "FIXME", "HACK" },
					layout = "select",
					buffers = true,
				})
			end
		end, "Find buffer todo")
		map("<leader>ftt", function()
			Snacks.picker.todo_comments({
				keywords = { "TODO", "FIX", "FIXME", "HACK" },
				layout = "select",
			})
		end, "Find todo")

		map("<leader>fu", function()
			Snacks.picker.undo()
		end, "Undo history")
		-- other snacks features
		map("<leader>bc", Snacks.bufdelete.delete, "Delete buffers")
		map("<leader>bC", Snacks.bufdelete.other, "Delete other buffers")
		map("<leader>gg", function()
			Snacks.lazygit({ cwd = Snacks.git.get_root() })
		end, "Open lazygit")
		map("<leader>gb", Snacks.git.blame_line, "Git blame line")
		map("<leader>n", Snacks.notifier.show_history, "Notification history")
		map("<leader>N", Snacks.notifier.hide, "Hide notifications")
		map("<leader>K", Snacks.image.hover, "Display image in hover")
		map("<leader>tt", function()
			Snacks.terminal.toggle()
		end, "Toggle terminal(Root)")
		map("<leader>tf", function()
			Snacks.terminal.toggle(nil, { cwd = vim.fn.expand("%:p:h") })
		end, "Toggle terminal(File Dir)")
		vim.keymap.set({ "n", "t" }, "<M-\\>", function()
			Snacks.terminal.toggle()
		end, { desc = "Toggle terminal" })
	end,
}
