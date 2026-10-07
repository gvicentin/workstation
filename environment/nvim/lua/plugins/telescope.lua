return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      require('telescope').setup {
        pickers = {
          help_tags = {
            theme = "ivy"
          },
          find_files = {
            theme = "ivy"
          },
          live_grep = {
            theme = "ivy"
          },
          git_files = {
            theme = "ivy",
            -- Include hidden files when using the Git files picker only.
            git_command = {
              "git",
              "ls-files",
              "--cached",
              "--others",
              "--exclude-standard",
              "--",
            },
          },
          buffers = {
            theme = "ivy"
          },
        },
        extensions = {
          fzf = {}
        }
      }

      require('telescope').load_extension('fzf')

      local telescope_builtin = require('telescope.builtin')
      vim.keymap.set("n", "<space>fh", telescope_builtin.help_tags)
      vim.keymap.set("n", "<space>fd", telescope_builtin.find_files)
      vim.keymap.set("n", "<space>fg", telescope_builtin.live_grep)
      vim.keymap.set("n", "<space>gf", telescope_builtin.git_files)
      vim.keymap.set("n", "<space>fb", telescope_builtin.buffers)
      vim.keymap.set("n", "<space>ff", telescope_builtin.current_buffer_fuzzy_find)
      vim.keymap.set("n", "<space>en", function()
        telescope_builtin.find_files {
          cwd = vim.fn.stdpath("config")
        }
      end)

      -- require "config.telescope.multigrep".setup()
    end
  }
}
