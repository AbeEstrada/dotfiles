vim.g.mapleader        = " "
vim.g.maplocalleader   = " "

vim.opt.number         = true                         -- Show line numbers
vim.opt.relativenumber = true
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
vim.keymap.set("n", "<leader>fg", function() Snacks.picker.git_files() end, { desc = "Find Git Files" })
vim.keymap.set("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fd", function() Snacks.picker.diagnostics_buffer() end, { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>ss", function() Snacks.picker.lsp_symbols() end, { desc = "LSP Symbols" })
vim.keymap.set("n", "<leader>z", function() Snacks.zen() end, { desc = "Toggle Zen Mode" })

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
  -- { src = "https://github.com/hrsh7th/nvim-cmp" },
  -- { src = "https://github.com/hrsh7th/cmp-path", },
  -- { src = "https://github.com/hrsh7th/cmp-buffer", },
  -- { src = "https://github.com/hrsh7th/cmp-cmdline", },
  -- { src = "https://github.com/hrsh7th/cmp-nvim-lsp", },
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
  picker    = { enabled = true },
  scope     = { enabled = true },
  indent    = {
    enabled = true,
    animate = { enabled = false },
  },
}

require("nvim-treesitter.configs").setup {
  auto_install     = true,
  ensure_installed = {
    "astro",
    "css",
    "csv",
    "diff",
    "git_config", "gitcommit", "git_rebase", "gitignore", "gitattributes",
    "go", "gomod", "gowork", "gosum",
    "html",
    "javascript",
    "json5",
    "lua",
    "markdown", "markdown_inline",
    "python", "requirements",
    "query",
    "regex",
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
    buffer_selected = {
      bg = colors.bg_highlight,
      fg = colors.purple,
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
require("mini.pairs").setup()
require("mini.comment").setup()
require("mini.surround").setup()
require("mini.completion").setup()
require("mini.jump").setup { delay = { idle_stop = 2500 } }
require("mini.jump2d").setup { mappings = { start_jumping = "'" } }
require("mini.basics").setup {
  options = { basic = false },
  autocommands = { basic = false },
}

vim.lsp.enable({
  "astro",
  "gopls",
  "lua_ls",
  "tailwindcss",
  "ts_ls",
})

require("conform").setup({
  formatters_by_ft = {
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

-- local cmp = require("cmp")
-- cmp.setup({
--   sources = {
--     { name = "nvim_lsp" },
--     { name = "buffer" },
--     { name = "path" },
--   },
--   window = {
--     completion = cmp.config.window.bordered(),
--     documentation = cmp.config.window.bordered(),
--   },
--   mapping = {
--     ["<C-f>"]     = cmp.mapping.scroll_docs(4),
--     ["<C-b>"]     = cmp.mapping.scroll_docs(-4),
--     ["<C-n>"]     = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
--     ["<C-p>"]     = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
--     ["<C-e>"]     = cmp.mapping.abort(),
--     ["<C-Space>"] = cmp.mapping.complete(),
--     ["<CR>"]      = cmp.mapping.confirm({ select = false }),
--   },
-- })
-- vim.lsp.config("*", { capabilities = require("cmp_nvim_lsp").default_capabilities() })
-- cmp.setup.cmdline({ "/", "?" }, {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = {
--     { name = "buffer" }
--   }
-- })
-- cmp.setup.cmdline(":", {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = cmp.config.sources({
--     { name = "path" }
--   }, {
--     { name = "cmdline" }
--   }),
--   matching = { disallow_symbol_nonprefix_matching = false }
-- })
