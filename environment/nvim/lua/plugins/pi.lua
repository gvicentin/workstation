return {
  "Run1e/pi-agent.nvim",
  config = function()
    local pi = require("pi-agent")
    pi.setup({
      surface = pi.get_surface("tmux")
    })
    vim.keymap.set("n", "<leader>as", pi.start, { desc = "pi: Start", noremap = true, silent = true })
    vim.keymap.set("n", "<leader>af", pi.focus, { desc = "pi: Focus", noremap = true, silent = true })
    vim.keymap.set("n", "<leader>ac", pi.close, { desc = "pi: Close", noremap = true, silent = true })
    vim.keymap.set({ "n", "x" }, "<leader>al",
      function() pi.paste_cursor_location(function(res) if res.ok then pi.focus() end end) end,
      { desc = "pi: Paste cursor location", noremap = true, silent = true })
    vim.keymap.set({ "n", "x" }, "<leader>ar",
      function() pi.paste_selection_location(function(res) if res.ok then pi.focus() end end) end,
      { desc = "pi: Paste range location", noremap = true, silent = true })
    vim.keymap.set({ "n", "x" }, "<leader>ap",
      function() pi.paste_selection_contents(function(res) if res.ok then pi.focus() end end) end,
      { desc = "pi: Paste selection contents", noremap = true, silent = true })
  end,
}
