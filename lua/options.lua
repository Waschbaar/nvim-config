local cmd = vim.cmd
local opt = vim.opt

local indent = 4

cmd[[
	filetype plugin indent on
    function! DisableIndent()
        set autoindent&
        set cindent&
        set smartindent&
        set indentexpr&
    endfunction

    autocmd FileType tex call DisableIndent()
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


