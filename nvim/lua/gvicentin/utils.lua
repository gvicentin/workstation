function Trim()
    local save = vim.fn.winsaveview()
    vim.api.nvim_exec("keeppatterns silent! %s/\\s\\+$//e", false)
    vim.fn.winrestview(save)
end
