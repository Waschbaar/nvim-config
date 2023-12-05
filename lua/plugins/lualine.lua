local ll = require("lualine")

local texcount = function()
    return vim.fn["vimtex#misc#wordcount"]()
end

local texext = {
    filetypes = {"tex"},
    sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch", "diff"},
        lualine_c = {"filename"},
        lualine_x = {texcount},
        lualine_y = {"progress"},
        lualine_z = {"location"},
    },
}

ll.setup({extensions = {  }})

