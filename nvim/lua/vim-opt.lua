-- Make background transparent
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.g.mapleader = " " -- Set leader key <Space>

vim.wo.number = true -- Show numbers
vim.g.loaded_netrw = 1 -- Disable netrw
vim.g.loaded_netrwPlugin = 1 -- Disable netrw
vim.opt.termguicolors = true -- Enable 24-bit colors
vim.opt.cursorline = true -- Highlight current line
vim.opt.cursorlineopt = "number"
vim.opt.clipboard = "unnamedplus" -- System clipboard
vim.opt.smartcase = true -- Search matters if capital letter
vim.opt.ignorecase = true -- Search case insensitive
vim.opt.inccommand = "split" -- "for incsearch while sub
vim.opt.splitbelow = true -- Split windows below
vim.opt.splitright = true -- Split windows right
vim.opt.swapfile = false -- Do not generate swap files

if vim.fn.getenv("TERM_PROGRAM") == "ghostty" then
  vim.opt.title = true
  vim.opt.titlestring = "%{fnamemodify(getcwd(), ':t')}"
end

