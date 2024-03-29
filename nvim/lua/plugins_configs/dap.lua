require('dap-go').setup()
require('dapui').setup()
require('nvim-dap-virtual-text').setup()

vim.api.nvim_set_keymap('n', '<leader>db', ':DapToggleBreakpoint<CR>',  { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>dc', ':DapContinue<CR>',  { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>di', ':DapStepInto<CR>',  { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>do', ':DapStepOver<CR>',  { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>dO', ':DapStepOut<CR>',  { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>dT', ':DapTerminate<CR>',  { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>dt', ":lua require ('dapui').toggle({ reset = true })<CR>",  { noremap = true })
