local vim              = vim -- suppress lsp warnings

vim.g.mapleader        = " "
vim.g.maplocalleader   = " "

vim.opt.number         = true                         -- Show line numbers
vim.opt.relativenumber = true                         -- Show relative numbers
vim.opt.cursorline     = true                         -- Enable cursor line highlighting
vim.opt.signcolumn     = "yes"                        -- Always show sign column (for diagnostics, git, etc.)
vim.opt.colorcolumn    = "80,120"                     -- Show vertical guidelines
vim.opt.list           = true                         -- Show invisible characters
vim.opt.listchars      = "tab:» ,lead:·,trail:·"      -- Define how invisible chars are displayed
vim.opt.scrolloff      = 10                           -- Lines above/below cursor
vim.opt.sidescrolloff  = 10                           -- Columns left/right of cursor

vim.opt.tabstop        = 2                            -- Number of spaces a tab counts for
vim.opt.shiftwidth     = 2                            -- Number of spaces to use for autoindent
vim.opt.softtabstop    = 2                            -- Number of spaces to insert/delete when editing
vim.opt.expandtab      = true                         -- Convert tabs to spaces
vim.opt.autoindent     = true                         -- Copy indent from current line when starting new line

vim.opt.undofile       = true                         -- Save undo history to file for persistence
vim.opt.linebreak      = true                         -- Wrap lines at 'breakat' characters
vim.opt.clipboard      = "unnamedplus"                -- Use system clipboard by default
vim.opt.backspace      = "indent,eol,start"           -- Better backspace behavior

vim.opt.hlsearch       = true                         -- Highlight search matches
vim.opt.ignorecase     = true                         -- Case-insensitive search
vim.opt.inccommand     = "split"                      -- Show substitution preview in split

vim.opt.termguicolors  = true                         -- Enable 24-bit RGB colors
vim.opt.showmode       = false                        -- Don't show mode indicator (handled by statusline)
vim.opt.winborder      = "rounded"                    -- Use rounded window borders

vim.opt.foldmethod     = "expr"                       -- Use expression-based folding
vim.opt.foldtext       = "&"                          -- Use default fold text
vim.opt.foldlevel      = 99                           -- Start with all folds open
vim.opt.foldexpr       = "nvim_treesitter#foldexpr()" -- Use Treesitter for folding

vim.opt.wildmenu       = true
vim.opt.wildmode       = "longest:full,full"

-- Keys

vim.keymap.set("n", "<up>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<down>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<left>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<right>", "<Nop>", { noremap = true, silent = true })

vim.keymap.set("n", "<Esc>", function()
  vim.cmd("nohlsearch")
end)

vim.keymap.set("n", "U", "<C-r>", { noremap = true, silent = true, desc = "Redo" })
vim.keymap.set("n", "<A-S-Right>", ":bnext<CR>", { noremap = true, silent = true, desc = "Next buffer" })
vim.keymap.set("n", "<A-S-Left>", ":bprevious<CR>", { noremap = true, silent = true, desc = "Previous buffer" })
vim.keymap.set("n", "<C-k>", ":move -2<CR>", { noremap = true, silent = true, desc = "Move line up" })
vim.keymap.set("n", "<C-j>", ":move +1<CR>", { noremap = true, silent = true, desc = "Move line down" })
vim.keymap.set("x", "<C-k>", ":move '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move lines up" })
vim.keymap.set("x", "<C-j>", ":move '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move lines down" })

vim.keymap.set("n", "<leader>/", function() Snacks.picker.grep() end, { desc = "Grep" })
vim.keymap.set("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fe", function() Snacks.explorer() end, { desc = "File Explorer" })
vim.keymap.set("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", function() Snacks.picker.git_files() end, { desc = "Find Git Files" })
vim.keymap.set("n", "<leader>fd", function() Snacks.picker.diagnostics_buffer() end, { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>ss", function() Snacks.picker.lsp_symbols() end, { desc = "LSP Symbols" })
vim.keymap.set("n", "<leader>z", function() Snacks.zen() end, { desc = "Toggle Zen Mode" })

vim.api.nvim_set_keymap("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { noremap = true, expr = true })
vim.api.nvim_set_keymap("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { noremap = true, expr = true })

vim.api.nvim_create_user_command("W", "w", { bang = true, nargs = "*" })
vim.api.nvim_create_user_command("Wq", "wq", { bang = true, nargs = "*" })
vim.api.nvim_create_user_command("WQ", "wq", { bang = true, nargs = "*" })
vim.api.nvim_create_user_command("Bda", function() require("snacks").bufdelete.all() end, { desc = "Close all buffers" })
vim.api.nvim_create_user_command("Bdo", function() require("snacks").bufdelete.other() end,
  { desc = "Delete all buffers except the current one" })

_G.cr_action = function()
  if vim.fn.complete_info()["selected"] ~= -1 then return '\25' end
  return '\r'
end
vim.keymap.set("i", "<CR>", "v:lua.cr_action()", { expr = true })

-- Plugins

vim.pack.add({
  { src = "https://github.com/folke/snacks.nvim" },
  { src = "https://github.com/folke/tokyonight.nvim" },
  { src = "https://github.com/akinsho/bufferline.nvim" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/stevearc/conform.nvim" },
  { src = "https://github.com/nvim-mini/mini.nvim" },
  { src = "https://github.com/norcalli/nvim-colorizer.lua" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  { src = "https://github.com/windwp/nvim-ts-autotag" },
  { src = "https://github.com/sQVe/sort.nvim" },
})

require("tokyonight").setup {
  transparent  = true,
  lualine_bold = true,
  styles       = {
    sidebars = "transparent",
    floats   = "transparent",
  },
}
vim.cmd.colorscheme "tokyonight"

local colors = require("tokyonight.colors").setup()

require("snacks").setup {
  bigfile   = { enable = true },
  quickfile = { enabled = true },
  input     = { enabled = true },
  scope     = { enabled = true },
  indent    = {
    enabled = true,
    animate = { enabled = false },
  },
  picker    = {
    enabled = true,
    on_show = function()
      vim.b.minicompletion_disable = true
    end,
    on_close = function()
      vim.b.minicompletion_disable = false
    end,
  },
}

require("nvim-treesitter.configs").setup {
  auto_install     = true,
  ensure_installed = {
    "astro",
    "css",
    "csv",
    "diff",
    "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore",
    "go", "gomod", "gowork", "gosum",
    "html",
    "javascript",
    "json5",
    "lua",
    "markdown", "markdown_inline",
    "python", "requirements",
    "regex",
    "ssh_config",
    "toml",
    "typst",
    "typescript", "tsx",
    "xml",
    "yaml",
  },
  highlight        = { enable = true, },
  indent           = { enable = true, },
  match            = { enable = true, },
  folds            = { enable = true, },
}

require("treesitter-context").setup { enable = true }

require("nvim-ts-autotag").setup()

local bufferline = require("bufferline")
bufferline.setup {
  options = {
    style_preset = bufferline.style_preset.no_italic,
    show_close_icon = false,
    show_buffer_icons = false,
    show_buffer_close_icons = false,
    separator_style = { "", "" },
    indicator = { style = "none" },
  },
  highlights = {
    fill = {
      bg = colors.bg,
    },
    buffer_selected = {
      bg = colors.bg_highlight,
      fg = colors.purple,
    },
    modified_selected = {
      bg = colors.bg_highlight,
    },
  },
}

require("lualine").setup {
  options = {
    section_separators   = "",
    component_separators = "",
  }
}

require("sort").setup()
require("gitsigns").setup()
require("colorizer").setup()
require("mini.basics").setup()
require("mini.comment").setup()
require("mini.surround").setup()
require("mini.completion").setup()
require("mini.jump").setup { delay = { idle_stop = 2500 } }
require("mini.jump2d").setup { mappings = { start_jumping = "'" } }

vim.lsp.enable({
  "astro",
  "biome",
  "gopls",
  "lua_ls",
  "tailwindcss",
  "ts_ls",
})

require("conform").setup({
  formatters_by_ft = {
    css             = { "prettier" },
    go              = { "goimports", "gofmt" },
    markdown        = { "prettier" },
    json            = { "biome", "prettier", stop_after_first = true },
    javascript      = { "biome", "prettier", stop_after_first = true },
    typescript      = { "biome", "prettier", stop_after_first = true },
    javascriptreact = { "biome", "prettier", stop_after_first = true },
    typescriptreact = { "biome", "prettier", stop_after_first = true },
  },
  formatters = {
    -- biome = { require_cwd = true },
  },
  default_format_opts = {
    lsp_format = "fallback",
  },
  format_on_save = function(bufnr)
    local ignore_filetypes = { "sql", "yaml", "yml" }
    if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
      return
    end
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    local bufname = vim.api.nvim_buf_get_name(bufnr)
    if bufname:match("/node_modules/") then
      return
    end
    return { timeout_ms = 500, lsp_format = "fallback" }
  end,
})

vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })
