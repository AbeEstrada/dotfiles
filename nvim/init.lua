local o = vim.opt
o.number = true
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.expandtab = true

local g = vim.g
g.mapleader       = " "
g.maplocalleader  = " "

vim.pack.add({
  "https://github.com/folke/tokyonight.nvim",
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

require("tokyonight.colors").setup()
vim.cmd[[colorscheme tokyonight-moon]]

local ts_parsers = {
  "lua"
}
local nts = require("nvim-treesitter")
nts.install(ts_parsers)
nts.update()

vim.keymap.set("n", "<leader>r", function()
  vim.cmd("luafile ~/.config/nvim/init.lua")
end, { desc = "Reload Neovim config" })
