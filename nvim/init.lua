local vim              = vim -- suppress lsp warnings

vim.g.mapleader        = " "
vim.g.maplocalleader   = " "

vim.opt.number         = true                    -- Show line numbers
vim.opt.relativenumber = true                    -- Show relative numbers
vim.opt.cursorline     = true                    -- Enable cursor line highlighting
vim.opt.signcolumn     = "yes"                   -- Always show sign column (for diagnostics, git, etc.)
vim.opt.colorcolumn    = "80,120"                -- Show vertical guidelines
vim.opt.list           = true                    -- Show invisible characters
vim.opt.listchars      = "tab:» ,lead:·,trail:·" -- Define how invisible chars are displayed
vim.opt.scrolloff      = 10                      -- Lines above/below cursor
vim.opt.sidescrolloff  = 10                      -- Columns left/right of cursor
vim.opt.mousescroll    = "ver:3,hor:0"           -- Disable horizontal scrolling with a trackpad

vim.opt.tabstop        = 2                       -- Number of spaces a tab counts for
vim.opt.shiftwidth     = 2                       -- Number of spaces to use for autoindent
vim.opt.softtabstop    = 2                       -- Number of spaces to insert/delete when editing
vim.opt.expandtab      = true                    -- Convert tabs to spaces
vim.opt.autoindent     = true                    -- Copy indent from current line when starting new line

vim.opt.swapfile       = false                   -- Disable swapfiles
vim.opt.undofile       = true                    -- Save undo history to file for persistence
vim.opt.linebreak      = true                    -- Wrap lines at 'breakat' characters
vim.opt.clipboard      = "unnamedplus,unnamed"   -- Use system clipboard by default
vim.opt.backspace      = "indent,eol,start"      -- Better backspace behavior

vim.opt.hlsearch       = true                    -- Highlight search matches
vim.opt.ignorecase     = true                    -- Case-insensitive search
vim.opt.inccommand     = "split"                 -- Show substitution preview in split

vim.opt.termguicolors  = true                    -- Enable 24-bit RGB colors
vim.opt.showmode       = false                   -- Don't show mode indicator (handled by statusline)
vim.opt.winborder      = "rounded"               -- Use rounded window borders

vim.opt.foldmethod     = "expr"                  -- Use expression-based folding
vim.opt.foldtext       = "&"                     -- Use default fold text
vim.opt.foldlevel      = 99                      -- Start with all folds open

vim.opt.wildmenu       = true
vim.opt.wildmode       = "longest:full,full"

-- Keys

vim.keymap.set("n", "<up>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<down>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<left>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<right>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "ZZ", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "ZQ", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<Esc>", function()
  vim.cmd("nohlsearch")
end)

vim.keymap.set("n", "U", "<C-r>", { noremap = true, silent = true, desc = "Redo" })
vim.keymap.set("n", "<A-S-Right>", ":bnext<CR>", { noremap = true, silent = true, desc = "Next buffer" })
vim.keymap.set("n", "<A-S-Left>", ":bprevious<CR>", { noremap = true, silent = true, desc = "Previous buffer" })

vim.keymap.set("n", "<leader>/", function() Snacks.picker.grep() end, { desc = "Grep" })
vim.keymap.set("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fe", function() Snacks.explorer() end, { desc = "File Explorer" })
vim.keymap.set("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fm", function() Snacks.picker.marks({ global = false }) end, { desc = "Marks" })
vim.keymap.set("n", "<leader>fF", function() Snacks.picker.files({ cwd = vim.fn.expand("%:p:h") }) end,
  { desc = "Find Files (Buffer Dir)" })
vim.keymap.set("n", "<leader>fd", function() Snacks.picker.diagnostics_buffer() end, { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>fg", function() Snacks.picker.git_files() end, { desc = "Find Git Files" })
vim.keymap.set("n", "<leader>gd", function() Snacks.picker.git_diff() end, { desc = "Git Diff (Hunks)" })
vim.keymap.set("n", "<leader>gs", function() Snacks.picker.git_status() end, { desc = "Git Status" })
vim.keymap.set("n", "<leader>gr", function() Snacks.picker.lsp_references() end, { desc = "LSP References" })
vim.keymap.set("n", "<leader>ss", function() Snacks.picker.lsp_symbols() end, { desc = "LSP Symbols" })
vim.keymap.set("n", "<leader>sk", function() Snacks.picker.keymaps() end, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>su", function() Snacks.picker.undo() end, { desc = "Undo History" })
vim.keymap.set("n", "<leader>lg", function() Snacks.lazygit.open() end, { desc = "Lazygit" })
vim.keymap.set("n", "<leader>zz", function() Snacks.zen() end, { desc = "Toggle Zen Mode" })

vim.api.nvim_set_keymap("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { noremap = true, expr = true })
vim.api.nvim_set_keymap("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { noremap = true, expr = true })
vim.api.nvim_set_keymap("i", "<Down>", [[pumvisible() ? "\<C-n>" : "\<Down>"]], { noremap = true, expr = true })
vim.api.nvim_set_keymap("i", "<Up>", [[pumvisible() ? "\<C-p>" : "\<Up>"]], { noremap = true, expr = true })

_G.cr_action = function()
  if vim.fn.complete_info()["selected"] ~= -1 then return '\25' end
  return '\r'
end
vim.keymap.set("i", "<CR>", "v:lua.cr_action()", { expr = true })

vim.keymap.set("n", "<leader>tb", function()
  -- https://gist.github.com/AbeEstrada/1d6b859bcbdc81f8f94ff44258a0cdae
  local word = vim.fn.expand("<cword>")
  local output = vim.fn.system("echo -n " .. word .. " | tog")
  output = output:gsub("%s+$", "")
  vim.api.nvim_command('normal! "_ciw' .. output)
end, { desc = "Toggle boolean under cursor using 'tog' shell command" })

vim.api.nvim_create_user_command("Q", "q", { bang = true, nargs = "*" })
vim.api.nvim_create_user_command("W", "w", { bang = true, nargs = "*" })
vim.api.nvim_create_user_command("Wq", "wq", { bang = true, nargs = "*" })
vim.api.nvim_create_user_command("WQ", "wq", { bang = true, nargs = "*" })
vim.api.nvim_create_user_command("Bda", function() require("snacks").bufdelete.all() end, { desc = "Delete all buffers" })
vim.api.nvim_create_user_command("Bdo", function() require("snacks").bufdelete.other() end,
  { desc = "Delete all buffers except the current one" })

-- Plugins

vim.pack.add({
  { src = "https://github.com/folke/snacks.nvim" },
  { src = "https://github.com/folke/tokyonight.nvim" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter",        version = "main" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/stevearc/conform.nvim" },
  { src = "https://github.com/nvim-mini/mini.nvim" },
  { src = "https://github.com/catgoose/nvim-colorizer.lua" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  { src = "https://github.com/windwp/nvim-ts-autotag" },
  { src = "https://github.com/gregorias/coop.nvim" },
  { src = "https://github.com/gregorias/coerce.nvim" },
  { src = "https://github.com/h3pei/copy-file-path.nvim" },
})

require("tokyonight").setup {
  transparent  = true,
  lualine_bold = true,
  dim_inactive = true,
  styles       = {
    sidebars = "transparent",
    floats   = "transparent",
  },
}
vim.cmd.colorscheme "tokyonight"

local colors = require("tokyonight.colors").setup()

require("snacks").setup {
  bigfile   = { enabled = true },
  bufdelete = { enabled = true },
  explorer  = { enabled = true },
  input     = { enabled = true },
  scope     = { enabled = true },
  scroll    = { enabled = true },
  quickfile = { enabled = true },
  indent    = {
    enabled = true,
    animate = { enabled = false },
    indent  = { char = "┊" },
    scope   = { char = "┊" },
  },
  picker    = {
    enabled  = true,
    on_show  = function() vim.b.minicompletion_disable = true end,
    on_close = function() vim.b.minicompletion_disable = false end,
  },
}

local ts_parsers = {
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
}

local nts = require("nvim-treesitter")
nts.install(ts_parsers)
vim.api.nvim_create_autocmd("FileType", {
  pattern = nts.get_installed(),
  callback = function(args)
    local bufnr = args.buf
    vim.treesitter.start(bufnr)
    vim.wo.foldexpr          = "v:lua.vim.treesitter.foldexpr()"
    vim.bo.indentexpr        = "v:lua.require'nvim-treesitter'.indentexpr"
    vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter.indent'.get_indent(v:lnum)"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "mail",
  callback = function()
    vim.opt_local.wrap      = true
    vim.opt_local.linebreak = true
  end,
})

require("treesitter-context").setup { enable = true }

require("nvim-ts-autotag").setup()

require("lualine").setup {
  options = {
    icons_enabled        = false,
    section_separators   = "",
    component_separators = "",
  },
  sections = {
    lualine_z = {
      "location",
      {
        function()
          return vim.api.nvim_buf_line_count(0)
        end,
        color = { fg = colors.fg, bg = colors.bg_highlight },
      },
    },
  },
}
require("colorizer").setup {
  lazy_load = false,
  user_default_options = {
    tailwind = true,
  },

}
require("coerce").setup()

require("gitsigns").setup()

require("mini.ai").setup()
require("mini.diff").setup()
require("mini.jump").setup()
require("mini.move").setup()
require("mini.align").setup()
require("mini.pairs").setup()
require("mini.comment").setup()
require("mini.surround").setup()
require("mini.operators").setup()
require("mini.splitjoin").setup()
require("mini.trailspace").setup()
require("mini.completion").setup {
  window = {
    info      = { border = "rounded" },
    signature = { border = "rounded" },
  },
}
require("mini.basics").setup { mappings = { windows = true } }
require("mini.jump2d").setup { mappings = { start_jumping = "'" } }
vim.api.nvim_set_hl(0, "MiniTablineCurrent", { bold = true })
require("mini.tabline").setup {
  show_icons = false,
  format = function(buf_id, label)
    local suffix = vim.bo[buf_id].modified and "● " or ""
    return MiniTabline.default_format(buf_id, label) .. suffix
  end,
}
require("mini.starter").setup {
  header = [[
 ███▄    █  ▓█████ ▒█████   ██▒   █▓  ██▓ ███▄ ▄███▓
 ██ ▀█   █  ▓█   ▀▒██▒  ██▒▓██░   █▒▒▓██▒▓██▒▀█▀ ██▒
▓██  ▀█ ██▒ ▒███  ▒██░  ██▒ ▓██  █▒░▒▒██▒▓██    ▓██░
▓██▒  ▐▌██▒ ▒▓█  ▄▒██   ██░  ▒██ █░░░░██░▒██    ▒██
▒██░   ▓██░▒░▒████░ ████▓▒░   ▒▀█░  ░░██░▒██▒   ░██▒
░ ▒░   ▒ ▒ ░░░ ▒░ ░ ▒░▒░▒░    ░ ▐░   ░▓  ░ ▒░   ░  ░
░ ░░   ░ ▒░░ ░ ░    ░ ▒ ▒░    ░ ░░  ░ ▒ ░░  ░      ░
   ░   ░ ░     ░  ░ ░ ░ ▒        ░  ░ ▒ ░░      ░
         ░ ░   ░      ░ ░        ░    ░         ░
  ]],
  evaluate_single = true,
  items = {
    { name = "Insert",   action = "enew",                         section = "" },
    { name = "Explorer", action = "lua Snacks.picker.explorer()", section = "" },
    { name = "Find",     action = "lua Snacks.picker.files()",    section = "" },
    { name = "Quit",     action = "qall",                         section = "" },
  },
  footer = "",
}

vim.lsp.enable({
  "astro",
  "biome",
  "cssls",
  "gopls",
  "html",
  "jsonls",
  "lua_ls",
  "markdown_oxide",
  "pylsp",
  "ruff",
  "tailwindcss",
  "taplo",
  "ts_ls",
})

require("conform").setup {
  formatters_by_ft = {
    css             = { "prettier" },
    go              = { "goimports", "gofmt" },
    markdown        = { "prettier" },
    json            = { "biome", "prettier", stop_after_first = true },
    javascript      = { "biome", "prettier", stop_after_first = true },
    typescript      = { "biome", "prettier", stop_after_first = true },
    javascriptreact = { "biome", "prettier", stop_after_first = true },
    typescriptreact = { "biome", "prettier", stop_after_first = true },
    swift           = { "swift_format" },
    toml            = { "taplo" },
    xml             = { "xmllint" }
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
    MiniTrailspace.trim()
    return { timeout_ms = 500, lsp_format = "fallback" }
  end,
}
vim.api.nvim_create_user_command("FormatDisable", function(args)
  if args.bang then
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = "Disable autoformat-on-save",
  bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = "Enable autoformat-on-save",
})
vim.keymap.set("n", "\\f", function()
  local is_disabled = vim.g.disable_autoformat or vim.b.disable_autoformat
  if is_disabled then
    vim.cmd("FormatEnable")
    print("  autoformat")
  else
    vim.cmd("FormatDisable")
    print("noautoformat")
  end
end, { desc = "Toggle autoformat-on-save" })
