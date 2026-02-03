local function on_attach(_, bufnr)
    local map = vim.keymap.set
    local opts = { buffer = bufnr, silent = true }

    map("n", "gd",         "<cmd>Lsp goto_definition<cr>",      opts)
    map("n", "gD",         "<cmd>Lsp goto_declaration<cr>",     opts)
    map("n", "gi",         "<cmd>Lsp goto_implementation<cr>",  opts)
    map("n", "gr",         "<cmd>Lsp references<cr>",           opts)
    map("n", "K",          "<cmd>Lsp hover<cr>",                opts)
    map("n", "<leader>ca", "<cmd>Lsp codeAction<cr>",           opts)
    map("n", "<leader>rn", "<cmd>Lsp rename<cr>",               opts)
    map("n", "]d",         "<cmd>Lsp next_diagnostic<cr>",      opts)
    map("n", "[d",         "<cmd>Lsp prev_diagnostic<cr>",      opts)
    map("n", "<leader>d",  "<cmd>Lsp show_diagnostics<cr>",     opts)
end

vim.lsp.config.pyright = {
    cmd = { "pyright", "--outputjson" },
    filetypes = { "python" },
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "basic",
            },
        },
    },
    on_attach = on_attach,
}

vim.lsp.config.yamlls = {
    cmd = { "yaml-language-server", "--stdio" },
    filetypes = { "yaml", "yaml.docker-compose" },
    settings = {
        yaml = {
            hover = true,
            completion = true,
            validate = true,
        },
    },
    on_attach = on_attach,
}

vim.lsp.enable("pyright")
vim.lsp.enable("yamlls")
