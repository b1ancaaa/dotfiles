local dap = require("dap")

local function ui_input(prompt, default)
	return coroutine.create(function(coro)
		vim.ui.input({
			prompt = "Path to executable: ",
			default = vim.fn.getcwd() .. "/",
			completion = "file",
		}, function(input)
			coroutine.resume(coro, input)
		end)
	end)
end

local function pick_executable()
	return coroutine.create(function(dap_run)
		Snacks.picker.files({
			title = "选择可执行文件",
			cmd = "fd",
			args = {
				"--type",
				"x",
				"--exclude",
				"*.bin", -- 排除 .bin 结尾的文件
				"--exclude",
				"*.out", -- 排除 .out 结尾的文件
				"--exclude",
				".git",
			},
			actions = {
				confirm = function(picker, item)
					picker:close()
					if item then
						local path = item.cwd .. "/" .. item.file
						coroutine.resume(dap_run, path)
					end
				end,
			},
		})
	end)
end

local function pick_rust_bin(callback)
	Snacks.picker.files({
		title = "Select Rust Binary",
		cwd = vim.fn.getcwd() .. "/target/debug",
		cmd = "fd",
		-- 过滤掉 deps 目录和 .d 文件，只看 debug 根目录的可执行文件
		args = { "--type", "x", "--max-depth", "1", "--exclude", "*.d" },
		actions = {
			confirm = function(picker, item)
				picker:close()
				if item then
					callback(item.path) -- 将路径传回给外部的 resume
				else
					callback(nil)
				end
			end,
		},
	})
end

-- NOTE: configure adapters
dap.adapters.codelldb = {
	type = "executable",
	command = "codelldb", -- or if not in $PATH: "/absolute/path/to/codelldb"
}
dap.adapters.cppdbg = {
	id = "cppdbg",
	type = "executable",
	command = "OpenDebugAD7", -- or if not in $PATH: "/absolute/path/to/OpenDebugAD7"
	options = { detached = false },
}
dap.adapters.gdb = {
	type = "executable",
	command = "gdb",
	args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
}

dap.configurations.cpp = {
	{
		name = "Launch (codelldb)",
		type = "codelldb",
		request = "launch",
		-- program = function()
		-- 	return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		-- end,

		program = ui_input,

		cwd = "${workspaceFolder}",
		stopOnEntry = false,
	},
	{
		name = "Launch (codelldb with picker)",
		type = "codelldb",
		request = "launch",
		program = pick_executable,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
	},
	{
		name = "Launch (gdb)",
		type = "cppdbg",
		MIMode = "gdb",
		request = "launch",
		miDebuggerPath = "/usr/bin/gdb",
		program = ui_input,
		cwd = "${workspaceFolder}",
		setupCommands = {
			{
				description = "Enable pretty-printing for gdb",
				ignoreFailures = true,
				text = "-enable-pretty-printing",
			},
		},
		stopAtBeginningOfMainSubprogram = false,
	},
	{
		name = "Launch (gdb with picker)",
		type = "cppdbg",
		MIMode = "gdb",
		request = "launch",
		miDebuggerPath = "/usr/bin/gdb",
		program = pick_executable,
		cwd = "${workspaceFolder}",
		setupCommands = {
			{
				description = "Enable pretty-printing for gdb",
				ignoreFailures = true,
				text = "-enable-pretty-printing",
			},
		},
		stopAtBeginningOfMainSubprogram = false,
	},
	{
		name = "Select and attach to process",
		type = "cppdbg",
		request = "attach",
		program = ui_input,
		pid = function()
			local name = vim.fn.input("Executable name (filter): ")
			return require("dap.utils").pick_process({ filter = name })
		end,
		cwd = "${workspaceFolder}",
	},
}

dap.configurations.rust = {
	{
		name = "Launch file",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
	},
}
