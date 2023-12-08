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
    },
    {
        "neovim/nvim-lspconfig",
    },
    {
        "simrat39/rust-tools.nvim",
        config = function()
            require("plugins.rust_tools")
        end,
        ft = {"rust"}
    },
    
    {
        "hrsh7th/cmp-buffer",
        name = "cmp1",
    },
    {
        "hrsh7th/cmp-nvim-lsp",
        name = "cmp2",
    },
    {
        "hrsh7th/cmp-nvim-lsp-signature-help",
        name = "cmp3",
    },
    {
        "hrsh7th/cmp-nvim-lua",
        name = "cmp4",
    },
    {
        "hrsh7th/cmp-path",
        name = "cmp5",
    },
    {
        "saadparwaiz1/cmp_luasnip",
        name = "cmpsnip",
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {"cmp1", "cmp2", "cmp3", "cmp4", "cmp5", "cmpsnip"},
        config = function()
            require("plugins.cmp")
        end,
        ft = {"rust"},
    }
}


require("lazy").setup(plugins)

