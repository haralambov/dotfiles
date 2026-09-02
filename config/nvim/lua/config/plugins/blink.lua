require('blink.cmp').setup({
    keymap = {
        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
        ['<CR>'] = { 'accept', 'fallback' },
    },

    completion = {
        list = {
            selection = {
                preselect = true,
                auto_insert = true
            }
        },
        menu = { border = 'rounded' },
        ghost_text = { enabled = true },
    },

    signature = { enabled = true },
})
