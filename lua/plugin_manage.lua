local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
	{
		"L3MON4D3/LuaSnip",
		version = "2.*",
        config = function()
            require("plugins.luasnip")
        end,
	},

    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
    },

    {
        "lervag/vimtex",
        lazy = false,
    },

    {
        "nvim-tree/nvim-web-devicons",
        name = "devicons",
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "devicons" },
        config = function()
            require("plugins.lualine")
        end,
    },

    {
        "tpope/vim-fugitive",
    },
    {
        "tpope/vim-repeat",
        name = "repeat",
    },
    {
        "ggandor/leap.nvim",
        dependencies = {"repeat"},
        config = function()
            require("leap").add_default_mappings()
        end,
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
        }
    },
    {
        "sainnhe/everforest",
        lazy = false,
    }
}


require("lazy").setup(plugins)

