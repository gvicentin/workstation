return {
  { "tpope/vim-fugitive" },
  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(_bufnr)
        -- vim.keymap.set('n', '[c', require('gitsigns').prev_hunk, { buffer = bufnr })
        -- vim.keymap.set('n', ']c', require('gitsigns').next_hunk, { buffer = bufnr })
        -- vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk, { buffer = bufnr })
      end,
    },
  },
}
