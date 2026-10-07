return {
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("diffview").setup({
        hooks = {
          view_opened = function(view)
            vim.cmd("DiffviewToggleFiles")
          end,
        },
      })

      -- Keymaps for Diffview integration
      vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "Git Diffview Open" })
      vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", { desc = "Git Current File History" })
      vim.keymap.set("n", "<leader>gx", "<cmd>DiffviewClose<CR>", { desc = "Close Diffview" })
    end
  },
}
