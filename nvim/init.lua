local o = vim.opt
o.number = true
o.signcolumn = "yes"
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.expandtab = true
o.undofile = true
o.termguicolors = true
o.clipboard = "unnamed" 
o.winborder = "rounded"
o.colorcolumn = "80,120"

local g = vim.g
g.mapleader       = " "
g.maplocalleader  = " "

vim.pack.add({
  "https://github.com/folke/tokyonight.nvim",
  "https://github.com/akinsho/bufferline.nvim",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/lukas-reineke/indent-blankline.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/nvim-treesitter/nvim-treesitter-context",
})

require("tokyonight.colors").setup()
vim.cmd[[colorscheme tokyonight-moon]]

require("lualine").setup {
  options = { section_separators = "", component_separators = "" }
}

require("bufferline").setup {
  options = {
    show_buffer_icons = false,
    indicator = {
      style = "underline",
    },
  }
}

require("ibl").setup()

