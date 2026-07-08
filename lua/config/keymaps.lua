local map = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic navigation
map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle file tree" })
map("n", "<leader>o", "<cmd>Neotree focus<cr>", { desc = "Focus file tree" })

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>",  { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>",   { desc = "Grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>",    { desc = "Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>",  { desc = "Help" })

-- Buffers
map("n", "<leader>bd", "<cmd>bd!<cr>",                  { desc = "Delete buffer" })

-- Splits
map("n", "<leader>sv", "<cmd>vsplit<cr>",               { desc = "Vertical split" })
map("n", "<leader>sh", "<cmd>split<cr>",                { desc = "Horizontal split" })

-- Window nav (ctrl + hjkl)
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Clear search highlight
map("n", "<Esc>", "<cmd>noh<cr><Esc>")

vim.keymap.set('n', '<leader>q', '<cmd>ToggleTerm<cr>', { desc = 'Toggle terminal' })

-- LSP (set in lsp config per-buffer, but global reminders)
-- gd, gD, gi, gr, K — all handled in lsp/init.lua

-- Terminal mode escape
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Make Ctrl+c behave like Esc in insert mode
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Exit insert mode" })
-- Smart paste from system clipboard
map("i", "<C-v>", function()
    vim.cmd("stopinsert")
    require("smart-paste").paste({ register = "+", key = "p" })
end, { desc = "Smart paste from system clipboard (insert mode)" })
-- DAP (debugging)
local dap_ok, dap = pcall(require, "dap")
if dap_ok then
    map("n", "<leader>bp", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
    map("n", "<leader>dc", dap.continue,          { desc = "Continue" })
    map("n", "<leader>di", dap.step_into,         { desc = "Step into" })
    map("n", "<leader>do", dap.step_over,         { desc = "Step over" })
    map("n", "<leader>dO", dap.step_out,          { desc = "Step out" })
    map("n", "<leader>dr", dap.repl.toggle,       { desc = "Toggle REPL" })
end

local dapui_ok, dapui = pcall(require, "dapui")
if dapui_ok then
    map("n", "<leader>du", dapui.toggle, { desc = "Toggle DAP UI" })
end
