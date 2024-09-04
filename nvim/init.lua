-- Reload config :source $MYVIMRC

-- Load colorscheme
vim.cmd "colorscheme tokyonight"

-- Make background transparent
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- Set leader key <Space>
vim.g.mapleader = ' '
-- Show numbers
vim.wo.number = true
-- Enable 24-bit colour
vim.opt.termguicolors = true
-- Highlight current line
vim.opt.cursorline = true
-- Set tab length
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
-- Show invisible characters
-- vim.opt.list = true
-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- Set system clibpboard
vim.opt.clipboard = "unnamedplus"

-- Plugins:

-- https://github.com/nvim-treesitter/nvim-treesitter
-- require("nvim-treesitter").setup() 
require("nvim-treesitter.configs").setup {
	ensure_installed = {
		"astro",
		"bash",
		"comment",
		"css",
		"csv",
		"diff",
		"editorconfig",
		"gitignore",
		"go",
		"gomod",
		"gosum",
		"html",
		"javascript",
		"json",
		"lua",
		"rust",
		"ruby",
		"python",
		"regex",
		"toml",
		"typescript",
		"vim",
		"xml",
		"yaml",
		"zig"
	},
	auto_install = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true
	}
}

-- https://github.com/windwp/nvim-ts-autotag
require("nvim-ts-autotag").setup()

-- https://github.com/nvim-treesitter/nvim-treesitter-context
require("treesitter-context").setup()

-- https://github.com/nvim-tree/nvim-web-devicons
require("nvim-web-devicons").setup()

-- https://github.com/norcalli/nvim-colorizer.lua
require("colorizer").setup()

-- https://github.com/ggandor/leap.nvim
require("leap").create_default_mappings()

-- https://github.com/stevearc/dressing.nvim
require("dressing").setup()

-- https://github.com/lukas-reineke/indent-blankline.nvim
require("ibl").setup {
	indent = {
		char = "▏",
	},
	scope = {
		show_exact_scope = true,
	}
}

-- https://github.com/akinsho/bufferline.nvim
require("bufferline").setup {
	options = {
		right_mouse_command = false,
		show_buffer_icons = false,
		indicator = {
			style = "underline"
		}
	}
}

-- https://github.com/nvim-lualine/lualine.nvim
require("lualine").setup {
	options = {
		section_separators = '',
		component_separators = ''
	}
}

-- https://github.com/echasnovski/mini.pairs
require("mini.pairs").setup()

-- https://github.com/lewis6991/gitsigns.nvim
require("gitsigns").setup()

-- https://github.com/nvim-tree/nvim-tree.lua
require("nvim-tree").setup()
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })

-- https://github.com/nvim-telescope/telescope.nvim
-- https://github.com/nvim-telescope/telescope-file-browser.nvim
-- https://github.com/nvim-telescope/telescope-ui-select.nvim
require("telescope").setup()
require("telescope").load_extension("fzf") -- make
require("telescope").load_extension("ui-select")
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<space>fe", ":Telescope file_browser<CR>")
