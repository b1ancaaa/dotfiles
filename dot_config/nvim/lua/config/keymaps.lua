-- 这种情况下如果不加 silent，每次按键底部都会显示 ":noh"
vim.keymap.set("n", "<Esc>", "<Cmd>noh<CR>", { silent = true })

vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-l>", "<Right>")
vim.keymap.set("i", "<C-j>", "<Down>")
vim.keymap.set("i", "<C-k>", "<Up>")

vim.keymap.set({ "n", "x", "o" }, "<S-h>", "^", { desc = "Start of  line" })
vim.keymap.set({ "n", "x", "o" }, "<S-l>", "$", { desc = "End of  line" })

vim.keymap.set({ "n", "x" }, "Q", ":wq<CR>")
vim.keymap.set({ "n", "x" }, "qq", ":q<CR>")

vim.keymap.set({ "t" }, "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
