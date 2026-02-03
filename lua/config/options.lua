local opt = vim.opt

-- Display
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.cursorcolumn = false
opt.signcolumn = "yes"
opt.wrap = false
opt.scrolloff = 8
opt.showmode = false          -- lualine handles this
opt.cmdheight = 1

-- Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Search
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Clipboard
opt.clipboard = "unnamedplus"

-- Backups / undo
opt.backup = false
opt.writebackup = false
opt.undofile = true

-- Perf
opt.updatetime = 250
opt.timeoutlen = 300

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Encoding
opt.fileencoding = "utf-8"
opt.encoding = "utf-8"

-- Terminal colors
opt.termguicolors = true
