return {
	"Mythos-404/xmake.nvim",
	version = "^3",
	event = { "User XmakeProject" },
	dependencies = { "akinsho/toggleterm.nvim" },
	config = function()
		require("xmake").setup({
			runner = {
				type = "toggleterm",
			},
			execute = {
				type = "toggleterm",
			},
		})
	end,
	init = function()
		local uv = vim.loop
		vim.api.nvim_create_autocmd("BufReadPost", {
			once = true,
			callback = function()
				if uv.fs_stat(uv.cwd() .. "/xmake.lua") then
					vim.api.nvim_exec_autocmds("User", { pattern = "XmakeProject" })
				end
			end,
		})
	end,
}
