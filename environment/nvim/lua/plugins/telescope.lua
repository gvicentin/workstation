return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local telescope_builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader><space>", telescope_builtin.buffers, {})
            vim.keymap.set('n', '<leader>gf', telescope_builtin.git_files, {})

            vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files, {})
            vim.keymap.set("n", "<leader>fg", telescope_builtin.live_grep, {})
            vim.keymap.set("n", "<leader>fh", telescope_builtin.help_tags, {})
            vim.keymap.set('n', '<leader>fd', telescope_builtin.diagnostics, {})
            vim.keymap.set('n', '<leader>fw', telescope_builtin.grep_string, {})
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = { require("telescope.themes").get_dropdown {} }
                }
            }

            -- To get ui-select loaded and working with telescope, you need to call
            -- load_extension, somewhere after setup function:
            require("telescope").load_extension("ui-select")
        end
    }
}
