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

-- Plugins:

-- https://github.com/nvim-treesitter/nvim-treesitter
require("nvim-treesitter").setup()

-- https://github.com/nvim-tree/nvim-web-devicons
require("nvim-web-devicons").setup()

-- https://github.com/norcalli/nvim-colorizer.lua
require("colorizer").setup()

-- https://github.com/lukas-reineke/indent-blankline.nvim
require("ibl").setup {
	scope = {
		enabled = true,
		show_start = true,
		show_end = true
	},
}

-- https://github.com/akinsho/bufferline.nvim
require("bufferline").setup {
	options = {
		show_buffer_icons = false,
		right_mouse_command = false,
		indicator = {
			style = "underline",
		},
	}
}

-- https://github.com/nvim-lualine/lualine.nvim
require("lualine").setup {
	options = {
		section_separators = '',
		component_separators = ''
	}
}

-- https://github.com/nvim-tree/nvim-tree.lua
require("nvim-tree").setup()
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })

-- https://github.com/nvim-telescope/telescope.nvim
require("telescope").setup()
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
	vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
