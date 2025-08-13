return {
  {
    'milanglacier/minuet-ai.nvim',
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require('minuet').setup {
        -- Your configuration options here
        virtualtext = {
          auto_trigger_ft = {},
          keymap = {
            -- accept whole completion
            accept = '<A-A>',
            -- accept one line
            accept_line = '<A-a>',
            -- accept n lines (prompts for number)
            accept_n_lines = '<A-z>',
            -- Cycle to prev completion item, or manually invoke completion
            prev = '<A-[>',
            -- Cycle to next completion item, or manually invoke completion
            next = '<A-]>',
            dismiss = '<A-e>',
          },
        },
      }
    end,
  }
}
