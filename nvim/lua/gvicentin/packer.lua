-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Color schemes
    use 'drewtempelmeyer/palenight.vim'
    use 'folke/tokyonight.nvim'
    use 'morhetz/gruvbox'

    -- Configurations for Nvim LSP and autocomplete
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    -- FZF
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'

    -- Airline bar
    use 'vim-airline/vim-airline-themes'
    use 'vim-airline/vim-airline'
end)
