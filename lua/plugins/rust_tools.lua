local rt = require("rust-tools")

rt.setup({
    server = {
        on_attach = function(_, bufnr)
            vim.keymap.set("n", "<C-Space>", rt.hover_actions.hover_actions, {buffer = bufnr})
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, {buffer = bufnr})
        end,
    },
})

vim.diagnostic.config({
    virtual_text = false,
    signs = false,
    update_in_insert = false,
    underline = true,
    severity_sort = false,
    float = {
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})

vim.cmd[[
autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focusable = false})
]]

