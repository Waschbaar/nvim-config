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
        config = function()
            require("plugins.luasnip")
        end,
        lazy = false,
	},

    {
        "folke/tokyonight.nvim",
        lazy = true,
    },

    {
        "lervag/vimtex",
        name = "vimtex",
        ft = {"tex"},
        config = function()
            require("plugins.vimtex")
        end
    },

    {
        "nvim-tree/nvim-web-devicons",
        name = "devicons",
        lazy = true,
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "devicons" },
        config = function()
            require("plugins.lualine")
        end,
        lazy = false,
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
        lazy = true,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        name = "treesitter",
        lazy = true,
    },
    {
        "neovim/nvim-lspconfig",
        name = "lspconfig",
        lazy = true,
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
        lazy = true,
    },
    {
        "hrsh7th/cmp-nvim-lsp",
        name = "cmp2",
        lazy = true,
    },
    {
        "hrsh7th/cmp-nvim-lsp-signature-help",
        name = "cmp3",
        lazy = true,
    },
    {
        "hrsh7th/cmp-nvim-lua",
        name = "cmp4",
        lazy = true,
    },
    {
        "hrsh7th/cmp-path",
        name = "cmp5",
        lazy = true,
    },
    {
        "saadparwaiz1/cmp_luasnip",
        name = "cmpsnip",
        lazy = true,
    },
    {
        "Waschbaar/cmp-vimtex",
        name = "cmptex",
        ft = {"tex"},
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {"cmp1", "cmp2", "cmp3", "cmp4", "cmp5", "cmpsnip", "lspconfig"},
        config = function()
            require("plugins.cmp")
        end,
        lazy = true,
        ft = {"rust", "tex"},
    },
    {
        "nvim-lua/plenary.nvim",
        lazy = true,
        name = "plenary",
    },
    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        dependencies = {"plenary", "treesitter"},
        lazy = true,
        ft = {"norg"},
        config = function()
            require("plugins.neorg")
        end,
    }
}

require("lazy").setup(plugins)

