local function on_attach(client, bufnr)
    local map = vim.keymap.set
    local opts = { buffer = bufnr, silent = true }
    map("n", "gd",         vim.lsp.buf.definition,      opts)
    map("n", "gD",         vim.lsp.buf.declaration,     opts)
    map("n", "gi",         vim.lsp.buf.implementation,  opts)
    map("n", "gr",         vim.lsp.buf.references,      opts)
    map("n", "K",          vim.lsp.buf.hover,           opts)
    map("n", "<leader>ca", vim.lsp.buf.code_action,     opts)
    map("n", "<leader>rn", vim.lsp.buf.rename,          opts)
    map("n", "]d",         vim.diagnostic.goto_next,    opts)
    map("n", "[d",         vim.diagnostic.goto_prev,    opts)
    map("n", "<leader>d",  vim.diagnostic.open_float,   opts)

    if client.server_capabilities.semanticTokensProvider then
        vim.lsp.semantic_tokens.start(bufnr, client.id)
    end
end

vim.lsp.config.pyright = {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_markers = { "pyproject.toml", "setup.py", ".git" },
    before_init = function(_, config)
        local venv_python = config.root_dir .. "/.venv/bin/python"
        if vim.fn.executable(venv_python) == 1 then
            config.settings.python.pythonPath = venv_python
        else
            config.settings.python.pythonPath = vim.fn.exepath("python3")
        end
    end,
    on_attach = on_attach,
    settings = {
        python = { analysis = { typeCheckingMode = "basic" } },
    },
}

vim.lsp.config.yamlls = {
    cmd = { "yaml-language-server", "--stdio" },
    filetypes = { "yaml", "yaml.docker-compose" },
    on_attach = on_attach,
    settings = {
        yaml = {
            hover = true,
            completion = true,
            validate = true,
        },
    },
}

vim.lsp.enable("pyright")
vim.lsp.enable("yamlls")
