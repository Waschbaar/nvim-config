local cmd = vim.cmd
local opt = vim.opt

local indent = 4

cmd[[
	filetype plugin indent on
]]

opt.expandtab = true
opt.shiftwidth = indent
opt.smartindent = true
opt.tabstop = indent

opt.cursorline = true
opt.number = true

opt.showmode = false

cmd[[
    colorscheme everforest
]]

vim.g.mapleader = ","

