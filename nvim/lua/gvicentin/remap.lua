local Remap = require("gvicentin.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<leader>tr", ":lua Trim()<CR>")
nnoremap("<leader>pv", ":Ex<CR>")
nnoremap("<leader>ff", ":Files<CR>")
nnoremap("<leader>fg", ":Rg<CR>")
