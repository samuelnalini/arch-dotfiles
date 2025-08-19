vim.opt.number = true		-- line numbers
vim.opt.relativenumber = false
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.g.clipboard = {
    name = "wl-clipboard",
    copy = {
        ["+"] = "wl-copy",
	["*"] = "wl-copy",
    },
    
    paste = {
        ["+"] = "wl-paste --no-newline",
	["*"] = "wl-paste --no-newline",
    },

    cache_enabled = 1,
}


vim.g.mapleader = " "

vim.keymap.set({'n', 'v'}, 'y', '"+y', { noremap = true })
vim.keymap.set({'n', 'v'}, 'p', '"+p', { noremap = true })
vim.keymap.set({'n', 'v'}, 'd', '"+d', { noremap = true })
vim.keymap.set({'n', 'x'}, ";", ":")
vim.keymap.set('n', "<leader>w", ":w<cr>")
vim.keymap.set('n', "<leader>q", ":q<cr>")

