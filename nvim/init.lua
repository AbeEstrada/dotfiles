vim.g.mapleader        = " "
vim.g.maplocalleader   = " "

-- Display
vim.opt.number         = true                    -- Show line numbers
vim.opt.relativenumber = true
vim.opt.cursorline     = true                    -- Enable cursor line highlighting
vim.opt.signcolumn     = "yes"                   -- Always show sign column (for diagnostics, git, etc.)
vim.opt.colorcolumn    = "80,120"                -- Show vertical guidelines at columns 80 and 120
vim.opt.list           = true                    -- Show invisible characters
vim.opt.listchars      = "tab:» ,lead:·,trail:·" -- Define how invisible chars are displayed
vim.opt.scrolloff      = 10                      -- Keep 10 lines above/below cursor
vim.opt.sidescrolloff  = 8                       -- Keep 8 columns left/right of cursor

-- Indentation & Tabs
vim.opt.tabstop        = 2    -- Number of spaces a tab counts for
vim.opt.shiftwidth     = 2    -- Number of spaces to use for autoindent
vim.opt.softtabstop    = 2    -- Number of spaces to insert/delete when editing
vim.opt.expandtab      = true -- Convert tabs to spaces
vim.opt.autoindent     = true -- Copy indent from current line when starting new line

-- Text & Editing
vim.opt.undofile       = true               -- Save undo history to file for persistence
vim.opt.linebreak      = true               -- Wrap lines at 'breakat' characters
vim.opt.clipboard      = "unnamedplus"      -- Use system clipboard by default
vim.opt.backspace      = "indent,eol,start" -- Better backspace behavior

-- Search
vim.opt.hlsearch       = true    -- Highlight search matches
vim.opt.ignorecase     = true    -- Case-insensitive search
vim.opt.inccommand     = "split" -- Show substitution preview in split

-- UI & Appearance
vim.opt.showmode       = false     -- Don't show mode indicator (handled by statusline)
vim.opt.termguicolors  = true      -- Enable 24-bit RGB colors
vim.opt.winborder      = "rounded" -- Use rounded window borders

-- Folding
vim.opt.foldmethod     = "expr"                       -- Use expression-based folding
vim.opt.foldlevel      = 99                           -- Start with all folds open
vim.opt.foldtext       = "&"                          -- Use default fold text
vim.opt.foldexpr       = "nvim_treesitter#foldexpr()" -- Use Treesitter for folding

-- Command-line completion
vim.opt.wildmenu       = true
vim.opt.wildmode       = "longest:full,full"

-- Keys

vim.keymap.set("n", "<up>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<down>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<left>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<right>", "<Nop>", { noremap = true, silent = true })

vim.keymap.set("n", "<Esc>", function()
  vim.cmd("nohlsearch")
  require("multicursor-nvim").clearCursors()
end, { desc = "Clear search highlight and multicursors" })

vim.keymap.set("n", "U", "<C-r>", { noremap = true, silent = true, desc = "Redo" })
vim.keymap.set("n", "<A-S-Right>", ":bnext<CR>", { noremap = true, silent = true, desc = "Next buffer" })
vim.keymap.set("n", "<A-S-Left>", ":bprevious<CR>", { noremap = true, silent = true, desc = "Previous buffer" })
vim.keymap.set("n", "<C-k>", ":move -2<CR>", { noremap = true, silent = true, desc = "Move line up" })
vim.keymap.set("n", "<C-j>", ":move +1<CR>", { noremap = true, silent = true, desc = "Move line down" })
vim.keymap.set("x", "<C-k>", ":move '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move lines up" })
vim.keymap.set("x", "<C-j>", ":move '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move lines down" })

vim.keymap.set("x", "an", function() vim.lsp.buf.selection_range("outer") end, { desc = "Incremental Selection (outer)" })
vim.keymap.set("x", "in", function() vim.lsp.buf.selection_range("inner") end, { desc = "Incremental Selection (inner)" })

vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>",
  { noremap = true, silent = true, desc = "Telescope: Find Files" })
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>",
  { noremap = true, silent = true, desc = "Telescope: Search Text" })
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>",
  { noremap = true, silent = true, desc = "Telescope: Buffers" })
vim.keymap.set("n", "<leader>fd", ":Telescope diagnostics<CR>",
  { noremap = true, silent = true, desc = "Telescope: Diagnostics" })
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>",
  { noremap = true, silent = true, desc = "Telescope: Help tags" })
vim.keymap.set("n", "<leader>fe", ":Telescope file_browser<CR>",
  { noremap = true, silent = true, desc = "Telescope: File Browser" })
vim.keymap.set("n", "<leader>Fe", ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true, silent = true, desc = "Telescope: File Browser Current" })

vim.keymap.set({ "n", "x" }, "<leader>n", function() require("multicursor-nvim").matchAddCursor(1) end)
vim.keymap.set({ "n", "x" }, "<leader>s", function() require("multicursor-nvim").matchSkipCursor(1) end)
vim.keymap.set({ "n", "x" }, "<leader>N", function() require("multicursor-nvim").matchAddCursor(-1) end)
vim.keymap.set({ "n", "x" }, "<leader>S", function() require("multicursor-nvim").matchSkipCursor(-1) end)

-- Plugins

vim.pack.add({
  { src = "https://github.com/folke/tokyonight.nvim" },
  { src = "https://github.com/akinsho/bufferline.nvim" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-telescope/telescope.nvim",              dependencies = { "nvim-lua/plenary.nvim" } },
  { src = "https://github.com/nvim-telescope/telescope-file-browser.nvim", dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" } },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/stevearc/conform.nvim" },
  { src = "https://github.com/nvim-mini/mini.pairs" },
  { src = "https://github.com/nvim-mini/mini.jump2d" },
  { src = "https://github.com/nvim-mini/mini.surround" },
  { src = "https://github.com/nvim-mini/mini.indentscope" },
  { src = "https://github.com/norcalli/nvim-colorizer.lua" },
  { src = "https://github.com/jake-stewart/multicursor.nvim" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  { src = "https://github.com/sQVe/sort.nvim" },
})

local colors = require("tokyonight.colors").setup {
  style           = "moon",
  transparent     = true,
  lualine_bold    = true,
  terminal_colors = true,
}
vim.cmd.colorscheme "tokyonight"

require("nvim-treesitter.configs").setup {
  auto_install     = true,
  ensure_installed = {
    "astro",
    "css",
    -- "csv",
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
  folds            = { enable = true },
}

require("treesitter-context").setup {
  enable = true,
}

local bufferline = require("bufferline")
bufferline.setup {
  options = {
    style_preset = bufferline.style_preset.no_italic,
    show_close_icon = false,
    show_buffer_icons = false,
    show_buffer_close_icons = false,
    separator_style = { "", "" },
    indicator = { style = "none" },
    -- diagnostics = "nvim_lsp",
  },
  highlights = {
    buffer_selected = {
      fg = colors.purple,
    },
  },
}

require("lualine").setup {
  options = {
    theme                = "auto",
    section_separators   = "",
    component_separators = "",
  }
}

require("telescope").setup {
  defaults = {
    prompt_prefix = "   ",
    selection_caret = " ",
    entry_prefix = " ",
    sorting_strategy = "ascending",
    layout_config = { prompt_position = "top" },
    file_ignore_patterns = { "^node_modules/", }
  },
}

require("sort").setup()

require("colorizer").setup()

require("multicursor-nvim").setup()

require("mini.surround").setup()

require("mini.jump2d").setup()

require("mini.pairs").setup()

require("mini.indentscope").setup { symbol = "│" }

require("gitsigns").setup {
  on_attach = function(bufnr)
    local gitsigns = require("gitsigns")

    vim.keymap.set("n", "]g", function()
      if vim.wo.diff then
        vim.cmd.normal({ "]g", bang = true })
      else
        gitsigns.nav_hunk("next")
      end
    end, { buffer = bufnr, desc = "Next hunk" })
    vim.keymap.set("n", "[g", function()
      if vim.wo.diff then
        vim.cmd.normal({ "[g", bang = true })
      else
        gitsigns.nav_hunk("previous")
      end
    end, { buffer = bufnr, desc = "Previous hunk" })
  end
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
