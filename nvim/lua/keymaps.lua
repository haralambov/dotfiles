-- Double 'j' to switch to normal mode
vim.keymap.set('i', 'jj', '<ESC>')

-- Make Shift+Tab decrease indent
vim.keymap.set('i', '<S-Tab>', '<C-d>')

-- Leader + q to close the buffer
vim.keymap.set('n', '<leader>q', ':q<CR>')

-- Leader + Q to close all buffers without saving
vim.keymap.set('n', '<leader>Q', ':qa<CR>')

-- Better tabbing, reselect tabbed text
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')

-- Backspace - cycle between current and most recent file
vim.keymap.set('n', '<BS>', '<C-^>')

-- Alt + hjkl to resize windows
vim.keymap.set('n', '<A-h>', ':vertical resize +3<CR>')
vim.keymap.set('n', '<A-j>', ':resize +3<CR>')
vim.keymap.set('n', '<A-k>', ':resize -3<CR>')
vim.keymap.set('n', '<A-l>', ':vertical resize -3<CR>')

-- Control + hjkl to jump between splits
vim.keymap.set('n', '<C-h>', '<C-w><C-h>')
vim.keymap.set('n', '<C-j>', '<C-w><C-j>')
vim.keymap.set('n', '<C-k>', '<C-w><C-k>')
vim.keymap.set('n', '<C-l>', '<C-w><C-l>')

-- Scroll up and down the window 5 lines at a time
vim.keymap.set('n', '<C-e>', '5<C-e>')
vim.keymap.set('n', '<C-y>', '5<C-y>')

-- Reselect pasted text
vim.keymap.set('n', 'gp', '`[v`]')

-- Easier splits: | splits right, - splits below
vim.keymap.set('n', '<BAR>', ':vsp %<CR>')
vim.keymap.set('n', '-', ':sp %<CR>')

-- Leader + s to save all files
vim.keymap.set('n', '<leader>s', ':wa<CR>')

-- Go to next quickfix list item
vim.keymap.set('n', '<leader>n', ':cnext<CR>')

-- Go to previous quickfix list item
vim.keymap.set('n', '<leader>p', ':cprevious<CR>')

-- Close quickfix list window
vim.keymap.set('n', '<leader>cc', ':cclose<CR>')

-- Go down/up by half a page and center the cursor
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Center the cursor when going from search to search
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

-- Allows moving up and down visually selected lines
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Join lines without moving the cursor
vim.keymap.set('n', 'J', "mzJ`z")

-- Preserve last register when pasting over
vim.keymap.set('x', '<leader>p', "\"_dP")

-- Shortcuts for calling fugitive's git wrapper
vim.keymap.set({ 'n', 'v' }, '<leader>g', ':Git<CR>')

-- Copy everything between { and } including the brackets
vim.keymap.set('n', 'YY', 'va{Vy')
