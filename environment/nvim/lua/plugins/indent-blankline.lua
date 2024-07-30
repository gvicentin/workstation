return {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- See `:help indent_blankline.txt`
    opts = {
        char = '┊',
        show_trailing_blankline_indent = false,
    },
    config = function()
        -- require("ibl").setup()
    end
}
