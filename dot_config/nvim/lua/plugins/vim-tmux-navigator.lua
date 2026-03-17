return {
	"christoomey/vim-tmux-navigator",
	-- 只在tmux环境中加载插件
	-- cond = function()
	-- 	return vim.env.TMUX ~= nil and vim.env.TMUX ~= ""
	-- end,
	-- -- 按命令延迟加载
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
	},
	-- 按键延迟加载（只在tmux中）
	keys = {
		{ "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Navigate Left" },
		{ "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Navigate Down" },
		{ "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Navigate Up" },
		{ "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Navigate Right" },
		{ "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", desc = "Navigate Previous" },
	},
	-- -- 插件加载前执行（用于非tmux环境）
	-- init = function()
	-- 	-- 如果不在tmux中，设置普通的窗口导航
	-- 	if not vim.env.TMUX or vim.env.TMUX == "" then
	-- 		vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
	-- 		vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
	-- 		vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
	-- 		vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
	-- 	end
	-- end,
}
