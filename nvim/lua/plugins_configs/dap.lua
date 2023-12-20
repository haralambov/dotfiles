require('dap-go').setup()
require('dapui').setup()
require('nvim-dap-virtual-text').setup()

vim.api.nvim_set_keymap('n', '<leader>dt', ':DapUiToggle<CR>',  { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>dc', ':DapContinue<CR>',  { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>db', ':DapToggleBreakpoint<CR>',  { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>dt', ':lua require ('dapui').open({ reset = true })<CR>',  { noremap = true })
