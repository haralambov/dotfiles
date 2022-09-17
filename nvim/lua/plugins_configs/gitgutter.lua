vim.api.nvim_set_keymap('n', ']h', ':GitGutterPrevHunk<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '[h', ':GitGutterNextHunk<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<LEADER>gp', ':GitGutterPreviewHunk<CR>', { noremap = true })
