local cmp = require("cmp")

vim.opt.completeopt = {"menuone", "noselect", "noinsert"}
vim.opt.shortmess = vim.opt.shortmess + {c = true}
vim.api.nvim_set_option("updatetime", 300)

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = {
        ["<C-z>"] = cmp.mapping.select_prev_item(),
        ["<C-q>"] = cmp.mapping.select_next_item(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        }),
    },
    sources = {
        { name = "path" },
        { name = "nvim_lsp", keyword_length = 3 },
        { name = "nvim_lsp_signature_help"},
        { name = "nvim_lua", keyword_length = 2 },
        { name = "buffer", keyword_length = 2 },
        { name = "luasnip", keyword_length = 2 },
    },
})

cmp.setup.filetype("tex", {
    sources = {
        { name = "vimtex" },
        { name = "luasnip" },
    }
})
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()

