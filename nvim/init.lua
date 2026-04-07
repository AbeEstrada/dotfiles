local vim            = vim -- suppress lsp warnings

vim.g.mapleader      = vim.keycode("<space>")
vim.g.maplocalleader = vim.keycode("<space>")

vim.opt.shortmess:append("I")     -- Do not show intro
vim.opt.number         = true     -- Show line numbers
vim.opt.relativenumber = true     -- Show relative numbers
vim.opt.cursorline     = true     -- Enable cursor line highlighting
vim.opt.title          = true     -- Update title with current file
vim.opt.titlestring    = [[nvim %(%M %)%{%empty(expand("%:t"))?"":expand("%:~:h")."/"%}%t]]
vim.opt.signcolumn     = "yes"    -- Always show sign column (for diagnostics, git, etc.)
vim.opt.colorcolumn    = "80,120" -- Show vertical guidelines
vim.opt.list           = true     -- Show invisible characters
vim.opt.listchars      = {        -- Define how invisible chars are displayed
  tab = "▏ ",
  trail = "·",
  extends = "»",
  precedes = "«",
}
vim.opt.scrolloff      = 10                    -- Lines above/below cursor
vim.opt.sidescrolloff  = 10                    -- Columns left/right of cursor
vim.opt.mousescroll    = "ver:3,hor:0"         -- Disable horizontal scrolling with a trackpad

vim.opt.tabstop        = 2                     -- Number of spaces a tab counts for
vim.opt.shiftwidth     = 2                     -- Number of spaces to use for autoindent
vim.opt.softtabstop    = 2                     -- Number of spaces to insert/delete when editing
vim.opt.expandtab      = true                  -- Convert tabs to spaces
vim.opt.autoindent     = true                  -- Copy indent from current line when starting new line

vim.opt.swapfile       = false                 -- Disable swapfiles
vim.opt.undofile       = true                  -- Save undo history to file for persistence
vim.opt.linebreak      = true                  -- Wrap lines at 'breakat' characters
vim.opt.clipboard      = "unnamedplus,unnamed" -- Use system clipboard by default
vim.opt.backspace      = "indent,eol,start"    -- Better backspace behavior

vim.opt.hlsearch       = true                  -- Highlight search matches
vim.opt.ignorecase     = true                  -- Case-insensitive search
vim.opt.inccommand     = "split"               -- Show substitution preview in split

vim.opt.termguicolors  = true                  -- Enable 24-bit RGB colors
vim.opt.showmode       = false                 -- Don't show mode indicator (handled by statusline)
vim.opt.winborder      = "rounded"             -- Use rounded window borders

vim.opt.foldmethod     = "expr"                -- Use expression-based folding
vim.opt.foldtext       = ""                    -- Use default fold text
vim.opt.foldlevel      = 99                    -- Start with all folds open

vim.opt.pumborder      = "rounded"             -- Popup menu (pum) border style
vim.opt.pumheight      = 10                    -- Max number of items in the popup menu
vim.opt.completeopt    = "menu,popup,noselect,noinsert"
vim.opt.wildmenu       = true
vim.opt.wildmode       = "longest:full,full"
vim.opt.wildignore     = vim.opt.wildignore + { "*/node_modules/*", "*/.git/*", "*/vendor/*" }

vim.opt.autoread       = true -- Reload files automatically
vim.opt.updatetime     = 1000 -- Set CursorHold delay
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  command = "checktime",      -- Trigger a file check
})


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

vim.keymap.set("n", "d", '"_d', { noremap = true, silent = true, desc = "Delete text without yanking" })
vim.keymap.set("n", "x", '"_x', { noremap = true, silent = true, desc = "Delete character without yanking" })
vim.keymap.set("n", "n", "nzzzv", { noremap = true, silent = true, desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true, silent = true, desc = "Previous search result (centered)" })
vim.keymap.set("n", "U", "<C-r>", { noremap = true, silent = true, desc = "Redo" })
vim.keymap.set("n", "<A-S-Right>", ":bnext<CR>", { noremap = true, silent = true, desc = "Next buffer" })
vim.keymap.set("n", "<A-S-Left>", ":bprevious<CR>", { noremap = true, silent = true, desc = "Previous buffer" })
vim.keymap.set("n", "gn", "<cmd>enew<CR>", { desc = "New buffer" })
vim.keymap.set("n", "gy", ":%y<CR>", { desc = "Yank entire buffer" })
vim.keymap.set("n", "vy", "ggVG", { desc = "Select entire buffer" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "LSP Line Diagnostics" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP Rename" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code actions" })

vim.keymap.set("n", "<leader>e", function() MiniFiles.open() end, { desc = "File Explorer" })
vim.keymap.set("n", "<leader>/", function() Snacks.picker.grep() end, { desc = "Grep" })
vim.keymap.set("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fe", function() Snacks.explorer() end, { desc = "File Explorer" })
vim.keymap.set("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fm", function() Snacks.picker.marks({ global = false }) end, { desc = "Marks" })
vim.keymap.set("n", "<leader>fF", function() Snacks.picker.files({ cwd = vim.fn.expand("%:p:h") }) end,
  { desc = "Find Files (Buffer Dir)" })
vim.keymap.set("n", "<leader>fd", function() Snacks.picker.diagnostics_buffer() end, { desc = "Buffer Diagnostics" })
vim.keymap.set("n", "<leader>fD", function() Snacks.picker.diagnostics() end, { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>fu", function() Snacks.picker.undo() end, { desc = "Undo" })
vim.keymap.set("n", "<leader>fg", function() Snacks.picker.git_files() end, { desc = "Find Git Files" })
vim.keymap.set("n", "<leader>gb", function() Snacks.picker.git_branches() end, { desc = "Git Branches" })
vim.keymap.set("n", "<leader>gd", function() Snacks.picker.git_diff() end, { desc = "Git Diff (Hunks)" })
vim.keymap.set("n", "<leader>gs", function() Snacks.picker.git_status() end, { desc = "Git Status" })
vim.keymap.set("n", "<leader>gr", function() Snacks.picker.lsp_references() end, { desc = "LSP References" })
vim.keymap.set("n", "<leader>ss", function() Snacks.picker.lsp_symbols() end, { desc = "LSP Symbols" })
vim.keymap.set("n", "<leader>sk", function() Snacks.picker.keymaps() end, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>sc", function() Snacks.picker.command_history() end, { desc = "Command History" })
vim.keymap.set("n", "<leader>sC", function() Snacks.picker.commands() end, { desc = "Command" })
vim.keymap.set("n", "<leader>su", function() Snacks.picker.undo() end, { desc = "Undo History" })
vim.keymap.set("n", "<leader>rf", function() Snacks.rename.rename_file() end, { desc = "Rename File" })
vim.keymap.set("n", "<leader>lg", function() Snacks.lazygit.open() end, { desc = "Lazygit" })
vim.keymap.set("n", "<leader>zz", function() Snacks.zen() end, { desc = "Toggle Zen Mode" })

vim.keymap.set({ "n", "x", "o" }, "<A-o>", function()
  if vim.treesitter.get_parser(nil, nil, { error = false }) then
    require("vim.treesitter._select").select_parent(vim.v.count1)
  else
    vim.lsp.buf.selection_range(vim.v.count1)
  end
end, { desc = "Select parent treesitter node or outer incremental lsp selections" })

vim.keymap.set({ "n", "x", "o" }, "<A-i>", function()
  if vim.treesitter.get_parser(nil, nil, { error = false }) then
    require("vim.treesitter._select").select_child(vim.v.count1)
  else
    vim.lsp.buf.selection_range(-vim.v.count1)
  end
end, { desc = "Select child treesitter node or inner incremental lsp selections" })

-- vim.keymap.set({ "n", "x", "o" }, "'", function() MiniJump2d.start() end, { desc = "Start 2d jumping" })

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
  local t = {
    ["true"] = "false",
    ["false"] = "true",
    ["True"] = "False",
    ["False"] = "True",
    ["TRUE"] = "FALSE",
    ["FALSE"] = "TRUE",
    ["1"] = "0",
    ["0"] = "1",
    yes = "no",
    no = "yes",
    Yes = "No",
    No = "Yes",
    YES = "NO",
    NO = "YES",
    ["and"] = "or",
    ["or"] = "and",
    And = "Or",
    Or = "And",
    AND = "OR",
    OR = "AND",
    on = "off",
    off = "on",
    On = "Off",
    Off = "On",
    ON = "OFF",
    OFF = "ON"
  }
  local w = vim.fn.expand("<cword>")
  local r = t[w]
  if r then vim.api.nvim_command('normal! "_ciw' .. r) end
end, { desc = "Toggle boolean/logical word under cursor" })

vim.api.nvim_create_user_command("Q", "q", { bang = true, nargs = "*" })
vim.api.nvim_create_user_command("W", "w", { bang = true, nargs = "*" })
vim.api.nvim_create_user_command("Wq", "wq", { bang = true, nargs = "*" })
vim.api.nvim_create_user_command("WQ", "wq", { bang = true, nargs = "*" })
vim.api.nvim_create_user_command("Bda", function() require("snacks").bufdelete.all() end, { desc = "Delete all buffers" })
vim.api.nvim_create_user_command("Bdo", function() require("snacks").bufdelete.other() end,
  { desc = "Delete all buffers except the current one" })
vim.api.nvim_create_user_command("Sttr", function(opts)
  local transformation = opts.args
  local text

  if opts.range > 0 then
    vim.cmd.normal({ "gv", bang = true })
    vim.cmd.normal("y")
    text = vim.fn.getreg('"')
  else
    text = vim.fn.expand("<cword>")
    if text == "" then return end
  end

  local result = vim.fn.system("sttr " .. transformation, text):gsub("\n$", "")

  if opts.range > 0 then
    vim.cmd.normal({ "gvc" .. result, bang = true })
  else
    vim.cmd("normal! ciw" .. result)
  end
end, {
  range = true,
  nargs = 1,
  desc = "Transform text using abhimanyu003/sttr"
})


-- Plugins

require("vim._core.ui2").enable({})

vim.pack.add({
  { src = "https://github.com/folke/tokyonight.nvim" },
  { src = "https://github.com/folke/snacks.nvim" },
  { src = "https://github.com/nvim-mini/mini.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter",        version = "main" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/stevearc/conform.nvim" },
  { src = "https://github.com/windwp/nvim-ts-autotag" },
  { src = "https://github.com/h3pei/copy-file-path.nvim" },
})

vim.cmd.packadd("matchit")
vim.cmd.packadd("nvim.difftool")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("tokyonight").setup {
  transparent  = true,
  dim_inactive = true,
  styles       = {
    floats   = "transparent",
    sidebars = "transparent",
    comments = { italic = true },
  },
}
local colors = require("tokyonight.colors").setup()
vim.cmd.colorscheme "tokyonight"

require("mini.basics").setup { mappings = { windows = true } }

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
    sources  = {
      grep     = { exclude = { "node_modules" } },
      files    = { exclude = { "node_modules" } },
      explorer = { exclude = { "node_modules" } },
    },
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

require("treesitter-context").setup { enable = true }

vim.api.nvim_create_autocmd("FileType", {
  pattern = "mail",
  callback = function()
    vim.opt_local.wrap      = true
    vim.opt_local.linebreak = true
  end,
})

vim.api.nvim_set_hl(0, "MiniTablineCurrent", { bold = true })
require("mini.tabline").setup {
  show_icons = false,
  format = function(buf_id, label)
    local suffix = vim.bo[buf_id].modified and "● " or ""
    return MiniTabline.default_format(buf_id, label) .. suffix
  end,
}

vim.lsp.enable({
  "astro",
  "biome",
  "cssls",
  "eslint",
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
vim.lsp.document_color.enable(true, { bufnr = 0 }, { style = "virtual" })
vim.api.nvim_create_user_command("LspInfo", "checkhealth vim.lsp", { desc = "Show LSP Info" })
vim.api.nvim_create_user_command("LspRestart", "lsp restart", { desc = "Restart LSP" })
vim.api.nvim_create_user_command("LspLog", function(_)
  local log_path = vim.lsp.log.get_filename()
  vim.cmd(string.format("edit %s", log_path))
end, { desc = "Show LSP log" })

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
vim.api.nvim_create_user_command("Format", function(opts)
  local formatters = opts.args ~= "" and opts.args or nil
  require("conform").format({
    async = false,
    lsp_format = "fallback",
    formatters = formatters,
  })
end, {
  desc = "Format current buffer (specify formatter)",
  nargs = "?",
  complete = function()
    return vim.tbl_keys(require("conform").get_formatters())
  end,
})
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

vim.schedule(function()
  require("mini.ai").setup()
  require("mini.git").setup()
  require("mini.move").setup()
  require("mini.jump").setup()
  require("mini.files").setup()
  require("mini.align").setup()
  require("mini.jump2d").setup()
  require("mini.comment").setup()
  require("mini.surround").setup()
  require("mini.operators").setup()
  require("mini.splitjoin").setup()
  require("mini.trailspace").setup()
  require("mini.statusline").setup {
    use_icons = false,
    content = {
      active = function()
        local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
        mode                = mode:upper()
        local git           = MiniStatusline.section_git({ trunc_width = 40 })
        local diff          = MiniStatusline.section_diff({ trunc_width = 75 })
        local diagnostics   = MiniStatusline.section_diagnostics({ trunc_width = 75 })
        local lsp           = MiniStatusline.section_lsp({ trunc_width = 75 })
        local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
        local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 120 })
        local search        = MiniStatusline.section_searchcount({ trunc_width = 75 })
        -- local location      = MiniStatusline.section_location({ trunc_width = 75 })
        local location      = string.format("%d:%d", vim.fn.line("."), vim.fn.col("."))
        local total         = string.format("%d", vim.fn.line("$"))
        local percentage    = "%p%%"
        return MiniStatusline.combine_groups({
          { hl = mode_hl,                  strings = { mode } },
          { hl = "MiniStatuslineFilename", strings = { filename } },
          "%<", -- Mark general truncate point
          { hl = "MiniStatuslineDevinfo",  strings = { git, diff, diagnostics, lsp } },
          "%=", -- End left alignment
          { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
          { hl = mode_hl,                  strings = { search, location, percentage, total } },
        })
      end
    }
  }
  require("mini.diff").setup {
    view = {
      style = "sign",
      signs = {
        add = "▎",
        change = "▎",
        delete = "",
      },
    },
  }
  require("mini.completion").setup {
    window = {
      info      = { border = "rounded" },
      signature = { border = "rounded" },
    },
  }
  vim.api.nvim_set_hl(0, "MiniHipatternsFixme", { fg = colors.black, bg = colors.red, bold = true })
  vim.api.nvim_set_hl(0, "MiniHipatternsHack", { fg = colors.black, bg = colors.orange, bold = true })
  vim.api.nvim_set_hl(0, "MiniHipatternsTodo", { fg = colors.black, bg = colors.blue, bold = true })
  vim.api.nvim_set_hl(0, "MiniHipatternsNote", { fg = colors.black, bg = colors.teal, bold = true })
  local hipatterns = require("mini.hipatterns")
  hipatterns.setup({
    highlighters = {
      fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
      hack  = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
      todo  = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
      note  = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
      -- hex_color = hipatterns.gen_highlighter.hex_color(),
    },
  })
  require("nvim-ts-autotag").setup()
end)
