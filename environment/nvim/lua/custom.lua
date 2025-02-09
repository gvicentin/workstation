-- Configure options
vim.o.colorcolumn = "88"

vim.o.splitbelow = true
vim.o.splitright = true

vim.wo.number = true
vim.wo.relativenumber = true

vim.o.mouse = 'a'

vim.o.breakindent = true

vim.o.wrap = false

vim.o.undofile = true

vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4

vim.o.hlsearch = false

vim.o.ignorecase = true
vim.o.smartcase = true

vim.wo.signcolumn = 'yes'

vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 600

vim.o.termguicolors = true

-- Copy to clipboard
vim.keymap.set("n", "<space>y", '"+y')
vim.keymap.set("v", "<space>y", '"+y')

-- Running lua code
vim.keymap.set("n", "<space><space>x", ":source %<CR>") -- source current file
vim.keymap.set("n", "<space>x", ":.lua<CR>")            -- execute current line
vim.keymap.set("v", "<space>x", ":lua<CR>")             -- execute visual selection

-- Quickfix navigation
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

-- Lsp mappings
vim.keymap.set('n', 'gdd', vim.lsp.buf.definition)
vim.keymap.set('n', 'grn', vim.lsp.buf.rename)
vim.keymap.set('n', 'gra', vim.lsp.buf.code_action)
vim.keymap.set('n', 'grr', vim.lsp.buf.references)
vim.keymap.set('n', 'gri', vim.lsp.buf.implementation)
vim.keymap.set('n', 'gQ', vim.lsp.buf.document_symbol)
vim.keymap.set('n', '<C-S>', vim.lsp.buf.signature_help)

-- Completions
--  see `:help ins-completion`
--  CTRL-X CTRL-O starts omni completion
--  CTRL-Y selects entry
--  CTRL-E cancel
--  CTRL-P and CTRL-N for navigation


-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})
