vim.keymap.set("n", "]t", function()
    require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
    require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

vim.keymap.set("n", "<leader>Tt", ":TodoTelescope<CR>")
vim.keymap.set("n", "<leader>TT", ":TodoTrouble<CR>")
vim.keymap.set("n", "<leader>Tq", ":TodoQuickFix<CR>")
vim.keymap.set("n", "<leader>Tl", ":TodoLocList<CR>")
