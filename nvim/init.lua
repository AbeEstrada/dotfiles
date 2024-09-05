-- Reload config :source $MYVIMRC

-- Load colorscheme
vim.cmd "colorscheme tokyonight"

-- Make background transparent
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- Set leader key <Space>
vim.g.mapleader = " "
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
		"jsdoc",
		"json",
		"jsonc",
		"lua",
		"markdown",
		"markdown_inline",
		"rust",
		"ruby",
		"python",
		"regex",
		"toml",
		"tsx",
		"typescript",
		"vim",
		"vimdoc",
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
	},
    textobjects = {
      move = {
        enable = true,
        goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
        goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
        goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
        goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
      },
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

-- https://github.com/chrisgrieser/nvim-spider
require("spider").setup()
vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })

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
		section_separators = "",
		component_separators = ""
	}
}

-- https://github.com/echasnovski/mini.pairs
require("mini.pairs").setup()

-- https://github.com/kylechui/nvim-surround
require("nvim-surround").setup()

-- https://github.com/lewis6991/gitsigns.nvim
require("gitsigns").setup()

-- https://github.com/nvim-tree/nvim-tree.lua
require("nvim-tree").setup()
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true, desc = " Tree Toggle" })

-- https://github.com/nvim-telescope/telescope.nvim
require("telescope").setup()
-- https://github.com/nvim-telescope/telescope-file-browser.nvim
require("telescope").load_extension("fzf") -- make
-- https://github.com/nvim-telescope/telescope-ui-select.nvim
require("telescope").load_extension("ui-select")
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
vim.keymap.set("n", "<leader>fe", ":Telescope file_browser<CR>", { desc = "File Browser" })

-- https://github.com/folke/which-key.nvim
require("which-key").setup {
	opts = {
		preset = "helix"
	}
}

-- https://github.com/hrsh7th/nvim-cmp
-- https://github.com/hrsh7th/cmp-nvim-lsp
require"cmp".setup {
  sources = {
    { name = "nvim_lsp" }
  }
}
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- https://github.com/neovim/nvim-lspconfig
local lspconfig = require("lspconfig")

-- https://github.com/LuaLS/lua-language-server
lspconfig.lua_ls.setup{
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
}

