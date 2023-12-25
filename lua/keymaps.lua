vim.g.mapleader = ","
vim.cmd[[
    autocmd FileType tex nmap <Leader>p <Plug>(vimtex-compile-ss)
    autocmd FileType tex nmap <Leader>c <Plug>(vimtex-clean)
    autocmd FileType tex nmap <Leader>e <Plug>(vimtex-errors)
]]
