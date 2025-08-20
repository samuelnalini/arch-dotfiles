return {

    { --> nightfly theme
        "bluz71/vim-nightfly-colors",
        name = "nightfly",
        lazy = false,
        priority = 1000,
        config = function(plugin)
            vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
            vim.cmd([[colorscheme nightfly]])
        end
    },

	{ --> lualine
		"nvim-lualine/lualine.nvim",
		dependencies = {"nvim-tree/nvim-web-devicons"},
	},

	{ --> telescope
		"nvim-telescope/telescope.nvim",
		dependencies = {"nvim-lua/plenary.nvim", "BurntSushi/ripgrep"},
	},

	{ --> telescope fuzzy finder
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release"
	},

	{ --> treesitter
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = "main",
		build = ":TSUpdate"
	},

    { --> nvim tree (file explorer)
        "nvim-tree/nvim-tree.lua",
        dependencies = {"nvim-tree/nvim-web-devicons"}
    },
}
