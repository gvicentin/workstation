-- lua/plugins/mini.lua
return {
  {
    'echasnovski/mini.nvim',
    enabled = true,
    config = function()
      require("mini.comment").setup()
      require("mini.pairs").setup()
      require("mini.surround").setup()
    end
  },
}
