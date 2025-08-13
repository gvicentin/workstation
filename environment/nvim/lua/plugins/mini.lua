-- lua/plugins/mini.lua
return {
  {
    'echasnovski/mini.nvim',
    enabled = true,
    config = function()
      require("mini.comment").setup()
      require("mini.surround").setup()
      require("mini.pairs").setup({
        mappings = {
          -- disable single quotes because of Clojure
          ["'"] = { action = 'closeopen', pair = "''", neigh_pattern = '*.', register = { cr = false } },
        },
      })
    end
  },
}
