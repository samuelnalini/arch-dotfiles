-- Keybinds

--[[

INDEX:

* grep

<leader>ff - grep in current working directory
<leader>fs - grep string
<leader>fr - grep recently opened files
<leader>fb - grep open buffers
<leader>fm - grep man pages
<leader>fh - grep nvim help docs

* nvim tree

<ctrl>n - toggle nvim tree

* save/quit

<leader>w - save
<leader>q - quit

* misc

; - commandline
y - yank/copy
p - paste
d - delete

]]


local opts = { noremap = true, silent = true }

-- Clipboard

vim.keymap.set({'n', 'v'}, 'y', '"+y', opts) --> copy
vim.keymap.set({'n', 'v'}, 'p', '"+p', opts) --> paste
vim.keymap.set({'n', 'v'}, 'd', '"+d', opts) --> delete

-- General

vim.keymap.set({'n', 'x'}, ";", ":", opts) --> ; into :
vim.keymap.set('n', "<leader>w", ":w<cr>", opts) --> space + w write
vim.keymap.set('n', "<leader>q", ":q<cr>", opts) --> space + q quit

-- Nvim Tree

vim.keymap.set('n', "<C-n>", "<cmd>NvimTreeToggle<cr>", opts)

-- Fuzzy Finder

--> grep in current working directory
vim.keymap.set('n', "<leader>ff", "<cmd>Telescope find_files<cr>", opts)

--> grep for a string, then open the file that contains it
vim.keymap.set('n', "<leader>fs", "<cmd>Telescope live_grep<cr>", opts)

--> grep in recently opened files
vim.keymap.set('n', "<leader>fr", "<cmd>Telescope oldfiles<cr>", opts)

--> Search buffers
vim.keymap.set('n', "<leader>fb", "<cmd>Telescope buffers<cr>", opts)

--> Search man pages
vim.keymap.set('n', "<leader>fm", "<cmd>Telescope man_pages<cr>", opts)

--> Search built-in help tags
vim.keymap.set('n', "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
