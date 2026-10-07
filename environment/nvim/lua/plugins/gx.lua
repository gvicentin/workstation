return {
  {
    "chrishrb/gx.nvim",
    keys = { { "gxx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
    cmd = { "Browse" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
  }
}
