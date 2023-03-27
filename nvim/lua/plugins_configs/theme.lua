-- vim.g.gruvbox_contrast_dark = 'hard'
vim.opt.background ='dark'
-- vim.cmd([[colorscheme gruvbox]])
vim.cmd([[highlight Normal ctermbg=NONE guibg=NONE]])

require('monokai').setup { palette = require('monokai').pro }
