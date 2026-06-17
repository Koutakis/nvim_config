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
vim.lsp.enable("pyright")
