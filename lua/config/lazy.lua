local plugins = {
    -- UI
    {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {},
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
        ft = { "markdown" },
    },
    {
        "rebelot/kanagawa.nvim",
        priority = 1000,
        config = function()
            require("kanagawa").setup({ transparent = true })
            vim.cmd.colorscheme("kanagawa")
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "kanagawa",
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

    -- Dashboard
    {
        "amansingh-afk/milli.nvim",
        lazy = false,
        config = function()
            require("milli").vimenter({ splash = "blackhole", loop = true })
        end,
    },

    -- File navigation
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        cmd = "Neotree",
        keys = {
            { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Neo-tree" },
            { "<leader>o", "<cmd>Neotree focus<cr>",  desc = "Focus Neo-tree" },
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        cmd = "Telescope",
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>",  desc = "Live grep" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>",    desc = "Buffers" },
            { "<leader>fh", "<cmd>Telescope help_tags<cr>",  desc = "Help tags" },
        },
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

    -- LSP & completion
    {
        "williamboman/mason.nvim",
        config = function() require("mason").setup() end,
    },
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
