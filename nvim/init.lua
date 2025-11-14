vim.g.mapleader       = " "
vim.g.maplocalleader  = " "

vim.opt.number = true
vim.opt.signcolumn = "yes"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.autoindent = true
vim.opt.linebreak = true
vim.opt.expandtab = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.hlsearch = true
vim.opt.showmode = false
vim.opt.termguicolors = true
vim.opt.inccommand = "split"
vim.opt.clipboard = "unnamed" 
vim.opt.winborder = "rounded"
vim.opt.colorcolumn = "80,120"

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldtext = "&"

vim.cmd.filetype("plugin indent on")

-- Keys

vim.keymap.set("n", "<Esc>",       "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
vim.keymap.set("n", "<A-S-Right>", ":bnext<CR>",          { noremap = true, silent = true, desc = "Next buffer" })
vim.keymap.set("n", "<A-S-Left>",  ":bprevious<CR>",      { noremap = true, silent = true, desc = "Previous buffer" })
vim.keymap.set("n", "<C-k>",       ":move -2<CR>",        { noremap = true, silent = true, desc = "Move line up" })
vim.keymap.set("n", "<C-j>",       ":move +2<CR>",        { noremap = true, silent = true, desc = "Move line down" })
vim.keymap.set("x", "<C-k>",       ":move '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move lines up" })
vim.keymap.set("x", "<C-j>",       ":move '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move lines down" })

local flash_opts = { prompt = { enabled = false } }
vim.keymap.set("n", "s", function() require("flash").jump(flash_opts) end,        { noremap = true, silent = true, desc = "Flash" })
vim.keymap.set("n", "S", function() require("flash").treesitter(flash_opts) end,  { noremap = true, silent = true, desc = "Flash Treesitter" })

vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true, desc = "Telescope: Find Files" })
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>",  { noremap = true, silent = true, desc = "Telescope: Search Text" })
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>",    { noremap = true, silent = true, desc = "Telescope: buffers" })
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>",  { noremap = true, silent = true, desc = "Telescope: help tags" })

-- Plugins

vim.pack.add({
  { src = "https://github.com/folke/tokyonight.nvim" },
  { src = "https://github.com/akinsho/bufferline.nvim" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/norcalli/nvim-colorizer.lua" },
  { src = "https://github.com/nvim-mini/mini.indentscope" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-telescope/telescope.nvim", tag = "0.1.9", dependencies = { "nvim-lua/plenary.nvim" }},
  { src = "https://github.com/folke/flash.nvim" },
  { src = "https://github.com/kylechui/nvim-surround" },
})

require("tokyonight").setup {
  style = "moon",
  transparent = true,
  terminal_colors = true,
}
vim.cmd[[colorscheme tokyonight]]

require("nvim-treesitter").setup {
  ensure_installed = {
    "astro",
    "css",
    "csv",
    "git_config", "gitcommit", "git_rebase", "gitignore", "gitattributes",
    "go", "gomod", "gowork", "gosum",
    "html",
    "javascript",
    "json5",
    "lua",
    "markdownlint-cli2", "markdown-toc",
    "ninja", "rst",
    "python", "pip_requirements",
    "toml",
    "typst",
    "typescript", "tsx",
    "xml",
    "yaml",
  },
  highlight = { enable = true },
  indent = { enable = true },
}

require("mini.indentscope").setup {
    symbol = "│",
    options = { try_as_border = true },
}

local bufferline = require("bufferline")
bufferline.setup {
  options = {
    style_preset = bufferline.style_preset.no_italic,
    show_close_icon = false,
    show_buffer_icons = false,
    show_buffer_close_icons = false,
    separator_style = { "", "" },
    indicator = {
      style = "none",
    },
  }
}

require("lualine").setup {
  options = { section_separators = "", component_separators = "", theme = "auto", }
}

require("colorizer").setup()

require("nvim-surround").setup()

--    Old text                    Command         New text
-----------------------------------------------------------------------
--    surr*ound_words             ysiw)           (surround_words)
--    surr*ound_words             ysiw(           ( surround_words )
--    *make strings               ys$"            "make strings"
--    [delete ar*ound me!]        ds]             delete around me!
--    remove <b>HTML t*ags</b>    dst             remove HTML tags
--    'change quot*es'            cs'"            "change quotes"
--    <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
--    delete(functi*on calls)     dsf             function calls

