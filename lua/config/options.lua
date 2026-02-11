local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Appearance
opt.cursorline = true
opt.signcolumn = "yes"
opt.fillchars = { eob = " " }

-- Behavior
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.splitbelow = true
opt.splitright = true
opt.scrolloff = 8

-- Encoding
opt.encoding = "utf-8"

-- Terminal colors
opt.termguicolors = true

-- Auto-save when leaving insert mode
vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = "*",
    callback = function()
        if vim.bo.modified and vim.fn.expand("%") ~= "" then
            vim.cmd("write")
        end
    end,
})
