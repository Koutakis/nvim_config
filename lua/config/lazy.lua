local plugins = {
    -- ui
    {
        "meanderingprogrammer/render-markdown.nvim",
        opts = {},
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
        ft = { "markdown" },
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                transparent = false,
            })
            -- change colorscheme here: tokyonight-night, tokyonight-storm, tokyonight-day, tokyonight-moon
            vim.cmd.colorscheme("tokyonight-night")
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "auto",
                    globalstatus = true,
                    icons_enabled = true,
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                },
            })
        end,
    },
    { "nvim-tree/nvim-web-devicons", lazy = true },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    { "karb94/neoscroll.nvim", config = true },

    -- dashboard
    -- {
    --     "amansingh-afk/milli.nvim",
    --     lazy = false,
    --     config = function()
    --         require("milli").vimenter({ splash = "blackhole", loop = true })
    --     end,
    -- },

    -- File navigation
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        cmd = "Neotree",
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        cmd = "Telescope",
    },
    {
        "mg979/vim-visual-multi",
        branch = "master",
        lazy = false,
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        dependencies = { "nvim-telescope/telescope.nvim" },
        config = function()
            require("telescope").load_extension("fzf")
        end,
    },

    -- SQL / Database
    {
        "tpope/vim-dadbod",
    },
    {
        "kristijanhusak/vim-dadbod-ui",
        dependencies = { "tpope/vim-dadbod" },
        cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection" },
        init = function()
            vim.g.db_ui_use_nerd_fonts = 1
        end,
    },

    -- Formatting
    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        config = function()
            require("conform").setup({
                formatters = {
                    ruff_format = {
                        command = "uv",
                        args = { "run", "ruff", "format", "--stdin-filename", "$FILENAME", "-" },
                        stdin = true,
                    },
                },
                formatters_by_ft = {
                    python = { "ruff_format" },
                },
                format_on_save = { timeout_ms = 500, lsp_fallback = true },
            })
        end,
    },

    -- Debugging
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "mfussenegger/nvim-dap-python",
            "jay-babu/mason-nvim-dap.nvim",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            require("mason-nvim-dap").setup({
                ensure_installed = { "python" },
                automatic_installation = true,
            })

            require("dap-python").setup(vim.fn.exepath("python3"))
            dapui.setup()

            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },

    -- LSP & completion
    {
        "williamboman/mason.nvim",
        config = function() require("mason").setup() end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({ ensure_installed = { "pyright", "yamlls" } })
        end,
    },
    { "neovim/nvim-lspconfig" },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        event = "InsertEnter",
    },
    { "L3MON4D3/LuaSnip", lazy = true },

    -- Editing
    { "windwp/nvim-autopairs",    event = "InsertEnter", config = true },
    { "numToStr/Comment.nvim",    lazy = false },
    { "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" }, lazy = false },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function() require("nvim-surround").setup({}) end,
    },
    { "akinsho/toggleterm.nvim", version = "*", config = true },
    {
        "nemanjamalesija/smart-paste.nvim",
        event = "VeryLazy",
        config = true,
    },

    -- Syntax
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
        },
    },
    {
        "cameron-wags/rainbow_csv.nvim",
        config = true,
        ft = { "csv", "tsv", "csv_semicolon", "csv_whitespace", "csv_pipe", "rfc_csv", "rfc_semicolon" },
        cmd = { "RainbowDelim", "RainbowDelimSimple", "RainbowDelimQuoted", "RainbowMultiDelim" },
    },
}

require("lazy").setup(plugins)
