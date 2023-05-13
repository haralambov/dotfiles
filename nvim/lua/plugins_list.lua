vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use ({ "catppuccin/nvim", as = "catppuccin" })

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })

            ts_update()
        end,
    }

    use 'ThePrimeagen/harpoon'
    use 'mbbill/undotree'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use 'lewis6991/gitsigns.nvim'

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    }

    use 'nvim-tree/nvim-web-devicons'
    use 'nvim-tree/nvim-tree.lua'
    use {'romgrk/barbar.nvim', requires = {
        'lewis6991/gitsigns.nvim',
        'nvim-tree/nvim-web-devicons',
    }}
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use 'romainl/vim-cool'
    use({
        "utilyre/barbecue.nvim",
        tag = "*",
        requires = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        after = "nvim-web-devicons", -- keep this if you're using NvChad
        config = function()
            require("barbecue").setup()
        end,
    })
    use {
        'goolord/alpha-nvim',
        config = function ()
            require'alpha'.setup(require'alpha.themes.dashboard'.config)
        end
    }
    use "lukas-reineke/indent-blankline.nvim"
end)
