-- line numbers
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.scrolloff = 8
vim.opt.cursorline = true

-- tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- line wrap
vim.opt.wrap = false

-- search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- appearance
vim.opt.background = "dark"
vim.opt.signcolumn = "no"

-- clipboard
vim.opt.clipboard:append("unnamedplus")

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.laststatus = 3

-- folding
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 100
