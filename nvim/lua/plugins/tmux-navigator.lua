return {
    "christoomey/vim-tmux-navigator",
    config = function()
        -- Keymap for changins windows
        vim.keymap.set('n', '<C-h>', '<cmd>TmuxNavigateLeft<CR>', { silent = true })
        vim.keymap.set('n', '<C-l>', '<cmd>TmuxNavigateRight<CR>', { silent = true })
        vim.keymap.set('n', '<C-j>', '<cmd>TmuxNavigateDown<CR>', { silent = true })
        vim.keymap.set('n', '<C-k>', '<cmd>TmuxNavigateUp<CR>', { silent = true })
    end
}
