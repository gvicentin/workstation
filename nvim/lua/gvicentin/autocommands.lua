vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    { 
        pattern = { "Jenkinsfile", "*.Jenkinsfile", "*.jenkinsfile" },
        command = "set filetype=groovy" 
    }
)
