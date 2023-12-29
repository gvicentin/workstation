-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", {})
vim.keymap.set("n", "<C-j>", "<C-w>j", {})
vim.keymap.set("n", "<C-k>", "<C-w>k", {})
vim.keymap.set("n", "<C-l>", "<C-w>l", {})

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", {})
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", {})
vim.keymap.set("n", "<C-Left>", ":vertical resize +2<CR>", {})
vim.keymap.set("n", "<C-Right>", ":vertical resize -2<CR>", {})

-- Custom utilities
vim.keymap.set("n", "<leader>tr", ":lua Trim()<CR>", {})

-- Delete to blackhole register
vim.keymap.set({"n", "v"}, "<leader>d", "\"_d", {})

-- Replace currently selected text with default register without yanking it
vim.keymap.set("v", "<leader>p", "\"_dP")
