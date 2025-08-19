-- Line Numbers

vim.opt.number = true --> line numbers
vim.opt.relativenumber = false

-- Spacing

vim.opt.tabstop = 4 --> number of spaces for <tab>
vim.opt.shiftwidth = 4 --> number of spaces for autoindent
vim.opt.expandtab = true --> convert tabs to spaces
vim.smartindent = true

-- Scrolling

vim.opt.wrap = false --> don't wrap long lines
vim.opt.scrolloff = 8 --> keep 8 lines above/below the cursor when scrolling
vim.opt.sidescrolloff = 8 --> keep 8 lines left/right of the cursor when horizontal scrolling

-- UI

vim.opt.termguicolors = true --> true color support
vim.opt.cursorline = true --> highlight the line the cursor is on

-- Gutter and sign column

vim.opt.signcolumn = "yes" --> always show the sign columns for git/lsp symbols

-- Performance

vim.opt.updatetime = 300 -- faster updates
vim.opt.timeoutlen = 500 -- time to wait for mapped sequence (leader keys)

-- Split Window Behavior

vim.opt.splitbelow = true -- new horizontal windows open below
vim.opt.splitright = true -- new vertical splits open to the right

-- Completion Menu

vim.opt.completeopt = { "menuone", "noselect" }

-- Confirmation Prompt

vim.opt.confirm = true -- Confirm

-- Mouse

vim.opt.mouse = "a" --> allow mouse

-- Clipboard

vim.opt.clipboard = "unnamedplus" --> system clipboard
vim.g.clipboard = { --> switching to wl-clipboard
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


