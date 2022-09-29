-- Double 'j' to switch to normal mode
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', { noremap = true })

-- Leader + q to close the buffer
vim.api.nvim_set_keymap('n', '<LEADER>q', ':q<CR>', { noremap = true })

-- Leader + Q to close all buffers without saving
vim.api.nvim_set_keymap('n', '<LEADER>Q', ':qa<CR>', { noremap = true })

-- Better tabbing, reselect tabbed text
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true })
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true })

-- Backspace - cycle between current and most recent file
vim.api.nvim_set_keymap('n', '<BS>', '<C-^>', { noremap = true })

-- Alt + hjkl to resize windows
vim.api.nvim_set_keymap('n', '<A-h>', ':vertical resize +3<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-j>', ':resize +3<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-k>', ':resize -3<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-l>', ':vertical resize -3<CR>', { noremap = true })

-- Control + hjkl to jump between splits
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w><C-h>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w><C-j>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w><C-k>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w><C-l>', { noremap = true })

-- Scroll up and down the window 5 lines at a time
vim.api.nvim_set_keymap('n', '<C-e>', '5<C-e>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-y>', '5<C-y>', { noremap = true })

-- Reselect pasted text
vim.api.nvim_set_keymap('n', 'gp', '`[v`]', { noremap = true })

-- Opens a terminal in a split below the current buffer
vim.api.nvim_set_keymap('n', '<LEADER>t', ':15sp<CR>:terminal<CR>a', { noremap = true })

-- Opens a terminal in a new tab
vim.api.nvim_set_keymap('n', '<LEADER>T', ':tabnew<CR>:terminal<CR>a', { noremap = true })

-- Out to normal mode in terminal
vim.api.nvim_set_keymap('t', '<ESC>', '<C-\\><C-n>', { noremap = true })
vim.api.nvim_set_keymap('t', 'jj', '<C-\\><C-n>', { noremap = true })

-- Easier splits: | splits right, - splits below
vim.api.nvim_set_keymap('n', '<BAR>', ':vsp %<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '-', ':sp %<CR>', { noremap = true })

-- Leader + s to save all files
vim.api.nvim_set_keymap('n', '<LEADER>s', ':wa<CR>', { noremap = true })

-- Close quickfix list window
vim.api.nvim_set_keymap('n', '<LEADER>cc', ':cclose<CR>', { noremap = true })

-- Make the current window the only one on the screen
vim.api.nvim_set_keymap('n', '<LEADER>o', ':on<CR>', { noremap = true })

-- Close all other tab pages
vim.api.nvim_set_keymap('n', '<LEADER>O', ':on<CR>', { noremap = true })

-- Go down/up by half a page and center the cursor
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true })
