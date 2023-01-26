-- disable netrw at the very start, recommended for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require "gvicentin.options"
require "gvicentin.autocommands"
require "gvicentin.keymaps"
require "gvicentin.util"
require "gvicentin.plugins"
