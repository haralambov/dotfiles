vim.api.nvim_set_keymap('n', '<LEADER>ff', ':Telescope find_files hidden=true<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<LEADER>fg', ':Telescope live_grep<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<LEADER>fb', ':Telescope buffers<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<LEADER>fh', ':Telescope help_tags<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<LEADER>fr', ':Telescope resume<CR>', { noremap = true })

