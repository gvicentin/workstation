return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = { "lua", "vim", "vimdoc", "c", "erlang", "go", "clojure" },
            highlight = { enable = true },
            indent = { enable = true},

            vim.filetype.add({
                extension = {
                    templ = "templ",
                },
            })
        })
    end
}
