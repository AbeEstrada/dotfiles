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
  "https://github.com/akinsho/bufferline.nvim",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/folke/flash.nvim",
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

local ts_parsers = {
  "lua"
}
local nts = require("nvim-treesitter")
nts.install(ts_parsers)
nts.update()

require("treesitter-context").setup()

local flash = require("flash")
vim.keymap.set({"n", "x", "o"}, "s", function() flash.jump() end, {desc = "Flash"})
vim.keymap.set({"n", "x", "o"}, "S", function() flash.treesitter() end, {desc = "Flash Treesitter"})
vim.keymap.set("o", "r", function() flash.remote() end, {desc = "Remote Flash"})
vim.keymap.set({"o", "x"}, "R", function() flash.treesitter_search() end, {desc = "Treesitter Search"})
vim.keymap.set("c", "<c-s>", function() flash.toggle() end, {desc = "Toggle Flash Search"})

