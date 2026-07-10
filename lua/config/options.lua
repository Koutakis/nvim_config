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
opt.clipboard = ""
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

-- OSC 52 clipboard over SSH - copy only, paste disabled
-- (Windows Terminal can't paste via OSC 52, and enabling paste makes yanking slow)
local function no_paste(reg)
    return function(lines)
    end
end

vim.g.clipboard = {
    name = 'OSC 52',
    copy = {
        ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
        ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
    },
    paste = {
        ['+'] = no_paste('+'),
        ['*'] = no_paste('*'),
    },
}

-- Auto-reload files changed outside nvim
opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
    pattern = "*",
    command = "checktime",
})

-- Disable swap files
opt.swapfile = false
opt.backup = false
opt.writebackup = false

-- Fix toggleterm/float windows rendering black instead of colorscheme background
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "term://*toggleterm#*",
    callback = function()
        vim.wo.winblend = 0
        vim.cmd("highlight! link NormalFloat Normal")
    end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        if vim.v.event.operator == "y" then
            require("vim.ui.clipboard.osc52").copy("+")(vim.v.event.regcontents)
        end
    end,
})
