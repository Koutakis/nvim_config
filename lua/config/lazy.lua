return require("lazy").setup({

    -- Theme
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            flavour = "mocha",
            transparent = true,
            styles = {
                comments = { "italic" },
                functions = { "bold" },
                variables = {},
                booleans = { "italic" },
            },
            integrations = {
                neo_tree = true,
                lualine = true,
                treesitter = true,
                telescope = true,
                indent_blankline = { enabled = true },
                native_diagnostic_colors = true,
            },
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)
            vim.cmd.colorscheme "catppuccin-mocha"
        end,
    },

    -- Icons
    { "nvim-tree/nvim-web-devicons", lazy = true },

    -- File tree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        opts = {
            window = {
                width = 30,
                mappings = {
                    ["<space>"] = false, -- don't conflict with leader
                },
            },
            filesystem = {
                filtered_names = {
                    contain_any_of = { ".git", ".hg", "node_modules", "__pycache__", ".venv" },
                },
                follow_current_file = { enabled = true },
            },
            buffers = {
                follow_current_file = { enabled = true },
            },
            source_defaults = {
                auto_open = true,
            },
            default_options = {
                number = false,
                relative_number = false,
            },
        },
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = { "python", "yaml", "lua", "bash", "json", "toml", "dockerfile", "sql", "markdown" },
            highlight = { enable = true },
            indent = { enable = true },
            autotag = { enable = true },
        },
    },

    -- Indent guides
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            indent = {
                char = "│",
                highlight = "IblIndent",
            },
            scope = {
                enabled = true,
                highlight = "IblScope",
                show_start = false,
                show_end = false,
            },
        },
    },

    -- Statusbar
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                theme = "catppuccin-mocha",
                globalstatus = true,
                icons_enabled = true,
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
            },
            sections = {
                lualine_a = { { "mode", separator = { left = "" }, padding = { left = 1 } } },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { "filename" },
                lualine_x = { "encoding", "fileformat", "filetype" },
                lualine_y = { { "progress", separator = { right = "" }, padding = { right = 1 } } },
                lualine_z = { { "location", separator = { right = "" }, padding = { right = 1 } } },
            },
        },
    },

    -- LSP
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim",

        },
        config = function()
            require("config.lsp")
        end,
    },

    -- Mason (LSP installer)
    {
        "mason-org/mason.nvim",
        opts = {},
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "pyright", "yamlls" },
        },
    },

    -- Completions
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            require("config.cmp")
        end,
    },

    -- Snippets
    { "L3MON4D3/LuaSnip", lazy = true },

    -- Autopairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },

    -- Comments
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        opts = {},
    },

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            defaults = {
                prompt_prefix = " › ",
                selection_caret = " › ",
                layout_strategy = "horizontal",
                layout_config = { height = 0.8 },
                preview = true,
            },
        },
    },

    -- Dashboard
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        dependencies = { "nvim-telescope/telescope.nvim" },
        opts = {
            theme = "hyper",
            config = {
                header = {
                    "                                                       ",
                    "   ██╗    ██╗ ████████╗██╗██╗   ██╗███████╗████████╗  ",
                    "   ██║    ██║ ╚══██╔══╝██║██║   ██║██╔════╝╚══██╔══╝  ",
                    "   ██║    ██║    ██║   ██║██║   ██║█████╗     ██║      ",
                    "   ██║    ██║    ██║   ██║╚██╗ ██╔╝██╔══╝    ██║      ",
                    "   ███████║    ██║   ██║ ╚████╔╝ ███████╗   ██║      ",
                    "   ╚══════╝    ╚═╝   ╚═╝  ╚═══╝  ╚══════╝   ╚═╝      ",
                    "                                                       ",
                },
                shortcut = {
                    { desc = " Find File",       command = "Telescope find_files",  key = "f" },
                    { desc = " Recent",          command = "Telescope oldfiles",    key = "r" },
                    { desc = " Grep",            command = "Telescope live_grep",   key = "g" },
                    { desc = " Config",          command = "edit ~/.config/nvim/init.lua", key = "c" },
                    { desc = " Quit",            command = "qa",                    key = "q" },
                },
            },
        },
    },

    -- Smooth scrolling (nice touch)
    { "karb94/neoscroll.nvim", opts = {} },

    -- Highlight todo/fixme/hack/etc
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "VeryLazy",
        opts = {},
    },
})
