
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
	},

    pickers = {
        man_pages = {
            sections = {
                "1", "2", "3",
                "4", "5", "6",
                "7", "8", "9"
            }
        }
    }
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

require("nvim-treesitter").setup({
    install_dir = vim.fn.stdpath("data") .. "/site",
})

local parsers = {
    "c", "cpp", "lua", "python", "bash", "markdown",
    "cmake", "make", "html", "css", "javascript",
    "asm", "objdump", "rust", "arduino",
    "dockerfile", "json", "yaml", "csv"
}

local treesitter_config = require("nvim-treesitter.config")
local installed_parsers = treesitter_config.get_installed()

local missing_parsers = {}

for _,lang in ipairs(parsers) do
    if not vim.tbl_contains(installed_parsers, lang) then
        table.insert(missing_parsers, lang)
    end
end

if #missing_parsers > 0 then
    vim.cmd("silent! lua require('nvim-treesitter').install(" .. vim.json.encode(missing_parsers) .. ")")
end

vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        pcall(vim.treesitter.start, args.buf)
    end
})

--[[vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        vim.bo.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
    end
})]]
