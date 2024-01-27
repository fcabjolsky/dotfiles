-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use('doums/darcula')
    use({ 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } })
    use('nvim-treesitter/playground')
    use { 'theprimeagen/harpoon',
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } }
    }
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }
    use('ThePrimeagen/vim-be-good')
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use 'nmac427/guess-indent.nvim'
    use { 'nvim-lualine/lualine.nvim' }
    use { 'nvim-tree/nvim-web-devicons' }
    use { 'MunifTanjim/nui.nvim' }
    -- use { '~/Documents/Desa/lua/git-push/' }
    -- use { '~/Documents/Desa/lua/git-blame' }
    use { 'fcabjolsky/git-blame' }
    use { 'fcabjolsky/git-push' }
    use { 'ThePrimeagen/git-worktree.nvim' }
    use { 'codota/tabnine-nvim', run = "./dl_binaries.sh" }
end)
