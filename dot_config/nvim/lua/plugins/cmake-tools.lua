return {
	"Civitasv/cmake-tools.nvim",
	event = { "User CmakeProject" },
	dependencies = { "stevearc/overseer.nvim", "nvim-lua/plenary.nvim" },
	opts = {
		cmake_use_preset = false,

		cmake_regenerate_on_save = true, -- 保存 CMakeLists.txt 时自动生成
		cmake_generate_options = {
			"-GNinja", -- 使用 Ninja 作为构建系统
			"-DCMAKE_EXPORT_COMPILE_COMMANDS=1",
		}, -- 强制开启编译数据库导出

		-- 智能路径配置
		cmake_build_directory = "out/${variant:buildType}",

		-- 核心功能：自动更新 compile_commands.json
		cmake_compile_commands_options = {
			action = "soft_link", -- 自动在项目根目录创建软链接，方便 LSP (clangd) 识别
			target = vim.fn.getcwd(),
		},

		-- 任务执行器：切换为更强大的 overseer
		cmake_executor = {
			name = "overseer",

			opts = {},
			default_opts = {
				overseer = {
					new_task_opts = {
						strategy = {
							"jobstart",
							use_terminal = false,
							perserve_output = false,
						},
					},
					-- if you don't want the overseer task list to open overwritting this
					-- function helps. Otherwise just remove this section
					on_new_task = function(task)
						-- require("overseer").open({ enter = false, direction = "right" })
					end,
				},
			},
		},

		-- 运行器配置
		cmake_runner = {
			name = "toggleterm",
			default_opts = {
				terminal = { focus = false },
			},
		},

		-- 调试配置
		cmake_dap_configuration = {
			name = "cpp",
			type = "codelldb",
			request = "launch",
			stopOnEntry = false,
			runInTerminal = true,
		},
	},

	keys = {
		{ "<leader>cg", "<cmd>CMakeGenerate<cr>", desc = "CMake: Generate Project" },
		{ "<leader>cb", "<cmd>CMakeBuild<cr>", desc = "CMake: Build Project" },
		{ "<leader>cr", "<cmd>CMakeRun<cr>", desc = "CMake: Run Project" },
		{ "<leader>cd", "<cmd>CMakeDebug<cr>", desc = "CMake: Debug Project" },
		{ "<leader>cqb", "<cmd>CMakeQuickBuild<cr>", desc = "CMake:Quick Build Project" },
		{ "<leader>cqr", "<cmd>CMakeQuickRun<cr>", desc = "CMake:Quick Run Project" },
		{ "<leader>cqd", "<cmd>CMakeQuickDebug<cr>", desc = "CMake:Quick Debug Project" },
		{ "<leader>cc", "<cmd>CMakeClean<cr>", desc = "CMake: Clean Project" },
		{ "<leader>css", "<cmd>CMakeSettings<cr>", desc = "CMake: Configure Settings" },
		{ "<leader>csb", "<cmd>CMakeSelectBuildTarget<cr>", desc = "CMake: Select Build Target" },
		{ "<leader>csl", "<cmd>CMakeSelectLaunchTarget<cr>", desc = "CMake: Select Launch Target" },
		{ "<leader>co", "<cmd>CMakeOpenCache<cr>", desc = "CMake: Open Cache" },
		{ "<leader>ct", "<cmd>CMakeSelectBuildType<cr>", desc = "CMake: Select Build Type" },
	},
	-- 注册检测事件
	init = function()
		local uv = vim.loop
		vim.api.nvim_create_autocmd("BufReadPost", {
			once = true,
			callback = function()
				if uv.fs_stat(uv.cwd() .. "/CMakeLists.txt") then
					vim.api.nvim_exec_autocmds("User", { pattern = "CmakeProject" })
				end
			end,
		})
	end,
}
