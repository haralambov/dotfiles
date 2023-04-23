-- plugins list
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'navarasu/onedark.nvim'
Plug 'lewis6991/gitsigns.nvim'

Plug 'williamboman/mason.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lualine/lualine.nvim'
Plug 'terrortylor/nvim-comment'
Plug 'windwp/nvim-autopairs'
Plug 'romainl/vim-cool'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'ggandor/leap.nvim'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'romgrk/barbar.nvim'

vim.call('plug#end')

require('plugins_configs/theme')
require('plugins_configs/lsp')
require('plugins_configs/telescope')
require('plugins_configs/tree')
require('plugins_configs/lualine')
require('plugins_configs/cmp')
require('plugins_configs/comment')
require('plugins_configs/autopairs')
require('plugins_configs/gitsigns')
require('plugins_configs/leap')
require('plugins_configs/mason')
require('plugins_configs/barbar')
