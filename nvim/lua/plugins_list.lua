-- plugins list
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lualine/lualine.nvim'
Plug 'terrortylor/nvim-comment'
Plug 'windwp/nvim-autopairs'
Plug 'airblade/vim-gitgutter'
Plug 'romainl/vim-cool'
Plug 'tpope/vim-surround'
-- Plug 'tpope/vim-fugitive'

vim.call('plug#end')

require('plugins_configs/theme')
require('plugins_configs/lsp')
require('plugins_configs/telescope')
require('plugins_configs/tree')
require('plugins_configs/lualine')
require('plugins_configs/cmp')
require('plugins_configs/comment')
require('plugins_configs/autopairs')
