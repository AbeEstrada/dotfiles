local o = vim.opt
o.number = true
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.expandtab = true
o.termguicolors = true

local g = vim.g
g.mapleader       = " "
g.maplocalleader  = " "

vim.pack.add({
  "https://github.com/folke/tokyonight.nvim",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/akinsho/bufferline.nvim",
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

require("tokyonight.colors").setup()
vim.cmd[[colorscheme tokyonight-moon]]

require("lualine").setup {
  options = { section_separators = "", component_separators = "" }
}

require("bufferline").setup()

local ts_parsers = {
  "lua"
}
local nts = require("nvim-treesitter")
nts.install(ts_parsers)
nts.update()

