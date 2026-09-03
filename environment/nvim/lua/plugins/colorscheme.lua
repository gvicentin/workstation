-- lua/plugins/mini.lua
return {
  {
    "miikanissi/modus-themes.nvim",
    priority = 1000,
    config = function()
      require("modus-themes").setup({
        variants = {
          modus_operandi = "tinted",
          modus_vivendi = "default",
        }
      })
      vim.cmd.colorscheme "modus_operandi"
    end
  }
}
