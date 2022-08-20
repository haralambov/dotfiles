require('nvim_comment').setup()

vim.api.nvim_set_keymap('n', '<C-_>', ':CommentToggle<CR>j', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-_>', ':CommentToggle<CR>j', { noremap = true })
