-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        requires = { {'nvim-lua/plenary.nvim'} }
    }


    use { 'pest-parser/pest.vim' }

    -- Vim Tex
    use { 
        'lervag/vimtex',
        lazy = false,
        vim.cmd([[
            let g:vimtex_view_method = 'zathura'
            let g:vimtex_view_automatic = 0
            let g:vimtex_compiler_latexmk = {'continuous': 0}
            let g:vimtex_quickfix_open_on_warning = 0
        ]])
   }
    -- THEMES
    -- 'rose-pine/neovim',
    -- 'sainnhe/everforest',
    -- 'ramojus/mellifluous.nvim',
    -- 'xero/miasma.nvim'
    -- 'arcticicestudio/nord-vim'
    use({
        'sainnhe/everforest',
        as = 'everforest',
        config = function()
            vim.cmd('colorscheme everforest')
        end,
    })


    use{
        'altermo/ultimate-autopair.nvim',
        event={'InsertEnter','CmdlineEnter'},
        branch='v0.6', --recomended as each new version will have breaking changes
        config=function ()
            require('ultimate-autopair').setup({
                    --Config goes here
            })
        end,
    }

    use({
        'kylechui/nvim-surround',
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require('nvim-surround').setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })

    use('unblevable/quick-scope')
    use{'github/copilot.vim', branch = 'release' }
    use('windwp/nvim-ts-autotag')
    use('tpope/vim-commentary')
        use('nvim-treesitter/nvim-treesitter', {
        run = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup {
                highlight = {
                    enable = true,
                },
                ensure_installed = { "c", "lua", "python", "tex" },
            }
        end
    })
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('jose-elias-alvarez/null-ls.nvim')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }

    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    }
end)
