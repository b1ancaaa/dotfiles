return {
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		config = function()
			require("config.debugger")
		end,
		keys = {
			-- 基础控制
			{
				"<leader>ds",
				function()
					require("dap").continue()
				end,
				desc = " Start/Continue",
			},
			{
				"<F2>",
				function()
					require("dap").continue()
				end,
				desc = " Start/Continue",
			},
			{
				"<leader>di",
				function()
					require("dap").step_into()
				end,
				desc = " Step into",
			},
			{
				"<F3>",
				function()
					require("dap").step_into()
				end,
				desc = " Step into",
			},
			{
				"<leader>do",
				function()
					require("dap").step_over()
				end,
				desc = " Step over",
			},
			{
				"<F4>",
				function()
					require("dap").step_over()
				end,
				desc = " Step over",
			},
			{
				"<leader>dO",
				function()
					require("dap").step_out()
				end,
				desc = " Step out",
			},
			{
				"<F5>",
				function()
					require("dap").step_out()
				end,
				desc = " Step out",
			},

			-- 会话管理
			{
				"<leader>dq",
				function()
					require("dap").close()
				end,
				desc = "DAP: Close session",
			},
			{
				"<leader>dr",
				function()
					require("dap").restart_frame()
				end,
				desc = "DAP: Restart frame",
			},
			{
				"<F6>",
				function()
					require("dap").restart()
				end,
				desc = "DAP: Start over",
			},
			{
				"<leader>dQ",
				function()
					require("dap").terminate()
				end,
				desc = " Terminate session",
			},
			{
				"<F7>",
				function()
					require("dap").terminate()
				end,
				desc = " Terminate session",
			},

			-- 运行与工具
			{
				"<leader>dc",
				function()
					require("dap").run_to_cursor()
				end,
				desc = "DAP: Run to Cursor",
			},
			{
				"<leader>dR",
				function()
					require("dap").repl.toggle()
				end,
				desc = "DAP: Toggle REPL",
			},
			{
				"<leader>dh",
				function()
					require("dap.ui.widgets").hover()
				end,
				desc = "DAP: Hover",
			},

			-- 断点管理
			{
				"<leader>db",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "DAP: Breakpoint",
			},
			{
				"<leader>dB",
				function()
					local input = vim.fn.input("Condition for breakpoint: ")
					if input ~= "" then
						require("dap").set_breakpoint(input)
					end
				end,
				desc = "DAP: Conditional Breakpoint",
			},
			{
				"<leader>dD",
				function()
					require("dap").clear_breakpoints()
				end,
				desc = "DAP: Clear Breakpoints",
			},
		},
	},

	{
		"rcarriga/nvim-dap-ui",
		ft = { "cpp", "c", "python", "java", "rust", "go" },
		dependencies = {
			"mfussenegger/nvim-dap",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
			"folke/lazydev.nvim",
		},
		config = function()
			require("nvim-dap-virtual-text").setup({})
			require("lazydev").setup({
				libiary = { "nvim-dap-ui" },
			})
			-- UI responsiveness
			local dap, dapui = require("dap"), require("dapui")
			-- dap.listeners.before.attach.dapui_config = function()
			--   dapui.open({ reset = true })
			--   -- custom_utils.reset_overseerlist_width()
			-- end
			-- dap.listeners.before.launch.dapui_config = function()
			--   dapui.open({ reset = true })
			--   -- custom_utils.reset_overseerlist_width()
			-- end
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
				-- custom_utils.reset_overseerlist_width()
			end

			dap.listeners.after.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.after.event_exited.dapui_config = function()
				dapui.close()
			end
			dap.listeners.after.disconnect.dapui_config = function()
				dapui.close()
			end

			-- customize UI layout
			dapui.setup({
				layouts = {
					{
						position = "left",
						size = 0.2,
						elements = {
							{ id = "stacks", size = 0.2 },
							{ id = "scopes", size = 0.5 },
							{ id = "breakpoints", size = 0.15 },
							{ id = "watches", size = 0.15 },
						},
					},
					{
						position = "bottom",
						size = 0.2,
						elements = {
							{ id = "repl", size = 0.3 },
							{ id = "console", size = 0.7 },
						},
					},
				},
			})
			-- Custom breakpoint icons
			vim.fn.sign_define("DapBreakpoint", {
				text = " ",
				texthl = "DapBreakpoint",
				linehl = "",
				numhl = "DapBreakpoint",
			})
			vim.fn.sign_define("DapBreakpointCondition", {
				text = " ",
				texthl = "DapBreakpointCondition",
				linehl = "DapBreakpointCondition",
				numhl = "DapBreakpointCondition",
			})
			vim.fn.sign_define("DapStopped", {
				text = " ",
				texthl = "DapStopped",
				linehl = "DapStopped",
				numhl = "DapStopped",
			})

			-- keymaps
			-- vim.keymap.set("n", "<leader>du", function()
			--   dapui.toggle({ reset = true })
			--   custom_utils.reset_overseerlist_width()
			-- end, { desc = "DAP: Toggle UI" })
			-- vim.keymap.set("n", "<F1>", function()
			--   dapui.toggle({ reset = true })
			--   custom_utils.reset_overseerlist_width()
			-- end, { desc = "DAP: Toggle UI" })

			-- vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "DAP: Toggle UI" })
			-- vim.keymap.set("n", "<F1>", dapui.toggle, { desc = "DAP: Toggle UI" })
		end,

		keys = {
			{
				"<leader>du",
				function()
					dapui.toggle()
				end,
				desc = "DAP: Toggle UI",
			},
			{
				"<F1>",
				function()
					dapui.toggle()
				end,
				desc = "DAP: Toggle UI",
			},
		},
	},
}
