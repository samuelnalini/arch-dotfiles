
-- Loading plugins

require("lualine").setup({
	options = {theme = "codedark"}
})

require("telescope").setup({
	extensions = {
		fzf = {
			fuzzy = true, -- false only does exact matching
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case" -- smart_case, ignore_case, respect_case
		}
	}
})

require("nvim-treesitter").setup({
	install_dir = vim.fn.stdpath("data") .. "/site"
})

require("nvim-tree").setup({
	renderer = {
		group_empty = false,
	},
	filters = {
		dotfiles = true,
	},
    view = {
        width = 30
    }
})

-- Load extensions

pcall(function()
	require("telescope").load_extension("fzf")
end)

-- Treesitter

require("nvim-treesitter.config").setup({
	ensure_installed = {
		"lua", "python", "javascript", "typescript",
		"html", "css", "json", "yaml", "bash", "markdown",
		"c", "cpp", "rust", "arduino", "asm", "cmake",
		"dockerfile", "make", "objdump"
	},
	highlight = { enable = true },
	indent = { enable = true },
	auto_install = true
})

