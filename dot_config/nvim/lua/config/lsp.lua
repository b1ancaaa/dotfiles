-- 4. 0.11 新特性：内置快捷键 (可选，0.11 已经自带了默认映射)
-- 例如：grn (rename), gra (code action), grr (references)
-- 如果你想自定义 LspAttach 逻辑：
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		-- 在这里可以针对特定 client 做处理
	end,
})
