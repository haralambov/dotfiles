return {
    cmd = { 'gopls' },

    filetypes = { 'go', 'gomod' },

    root_markers = { 'go.work', 'go.mod', '.git', },

    settings = {
        gopls = {
            completeFunctionCalls = true,

            hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
            },

            analyses = {
                unusedparams = true,
                unusedwrite = true,
                nilness = true,
                shadow = true,
                ST1000 = false,
            },

            staticcheck = true,
        },
    },
}
