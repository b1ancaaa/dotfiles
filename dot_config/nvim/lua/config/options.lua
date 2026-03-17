vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
-- vim.g.markdown_folding = 1
vim.opt.linebreak = true
vim.g.simple_indicator_on = false
vim.o.winborder = "rounded"
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.opt.shell = "fish"

-- vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

-- read file automatically when changed outside of nvim
vim.opt.autoread = true

-- [[ Setting options ]]
-- See `:help vim.opt`
--  For more options, you can see `:help option-list`
vim.opt.termguicolors = true

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.numberwidth = 4

-- enable soft line wrap
vim.opt.wrap = true

-- only one statusline
vim.opt.laststatus = 3

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeout = false

-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
-- vim.opt.list = true
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true
vim.opt.colorcolumn = "120"

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 5

-- Big file limit
vim.g.bigfile_size = 1024 * 1024 * 1.5 -- 1.5 MB

-- folding
-- require 'config.folding'

-- diagnostics
vim.diagnostic.config({
	virtual_text = {
		spacing = 4,
		-- source = "if_many",
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
			[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
			[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
			[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
		},
	},
	underline = true,
	update_in_insert = true,
	severity_sort = true,
})

-- 自动删除特殊 buffer (如 LspInfo, Mason 等)
-- 当这些窗口关闭时，自动删除对应的 buffer
vim.api.nvim_create_autocmd("BufWinLeave", {
	pattern = "*",
	callback = function(event)
		local buftype = vim.bo[event.buf].buftype
		local filetype = vim.bo[event.buf].filetype

		-- 检查是否是特殊类型的 buffer
		local special_types = {
			"lspinfo",
			"mason",
			"lazy",
			"checkhealth",
			"qf",
			"query",
		}

		local is_special = buftype == "nofile" or buftype == "quickfix"
		for _, ft in ipairs(special_types) do
			if filetype == ft then
				is_special = true
				break
			end
		end

		-- 如果是特殊 buffer 且没有其他窗口显示它，则删除
		if is_special then
			vim.schedule(function()
				if vim.api.nvim_buf_is_valid(event.buf) then
					local wins = vim.fn.win_findbuf(event.buf)
					if #wins == 0 then
						-- 使用 pcall 保护删除操作，避免错误
						pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
					end
				end
			end)
		end
	end,
})
