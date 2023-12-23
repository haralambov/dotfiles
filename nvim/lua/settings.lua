vim.g.mapleader = ' '
vim.o.background = "dark"
vim.cmd.colorscheme "catppuccin-mocha"

vim.opt.path = vim.opt.path + '**'
vim.opt.hidden = true
vim.opt.wrap = false
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.cache/undodir"
vim.opt.undofile = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.updatetime = 50
vim.opt.scrolloff = 5
vim.opt.list = true
vim.opt.signcolumn = 'yes'
vim.opt.spell = true
vim.opt.laststatus = 3
vim.opt.clipboard = vim.opt.clipboard + 'unnamedplus'
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.colorcolumn = "80"
vim.opt.showmode = false

