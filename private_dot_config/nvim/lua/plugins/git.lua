return {
    {
        "FabijanZulj/blame.nvim",
        opts = {
            virtual_style = "float",
            merge_consecutive = false,
        },
        keys = {
            { "<leader>gb", "<cmd>ToggleBlame virtual<cr>", desc = "[G]it [B]lame" },
        }
    },
    {
        "sindrets/diffview.nvim",
        cmd = {
            "DiffviewOpen",
            "DiffviewClose",
            "DiffviewToggleFiles",
            "DiffviewFocusFiles",
        },
        config = true,
    },
    {
        'akinsho/git-conflict.nvim',
        version = "*",
        cmd = {
            "GitConflictChooseOurs",
            "GitConflictChooseTheirs",
            "GitConflictChooseBoth",
            "GitConflictChooseNone",
            "GitConflictNextConflict",
            "GitConflictPrevConflict",
            "GitConflictListQf",
        },
        config = true
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "nvim-telescope/telescope.nvim", -- optional
            "sindrets/diffview.nvim",        -- optional
        },
        cmd = "Neogit",
        opts = {
            integrations = {
                diffview = true,
                telescope = true,
            },

        },
        keys = {
            { "<leader>gs", "<cmd>Neogit kind=tab<cr>", desc = "[G]it [S]tatus" },
        },
    },
    -- {
    --     "tpope/vim-fugitive",
    --     keys = { { "<leader>gs", vim.cmd.Git, desc = "Git" } },
    -- },
}
