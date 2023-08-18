return {
    "nvim-neorg/neorg",
    enabled = false,
    lazy = true,
    keys = {
        { "<leader>jj", "<cmd>Neorg journal today<cr>",     desc = "Journal Today" },
        { "<leader>jt", "<cmd>Neorg journal tomorrow<cr>",  desc = "Journal Tomorrow" },
        { "<leader>jy", "<cmd>Neorg journal yesterday<cr>", desc = "Journal Yesterday" },
    },
    config = function()
        require('neorg').setup {
            load = {
                ["core.defaults"] = {}, -- Loads default behaviour
                ["core.export"] = {},
                ["core.summary"] = {},
                ["core.presenter"] = { -- Adds pretty icons to your documents
                    config = {
                        zen_mode = "zen-mode",
                    }
                },
                ["core.concealer"] = { -- Adds pretty icons to your documents
                    config = {
                        folds = true,
                    }
                },
                ["core.dirman"] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            notes = "~/notes",
                        },
                        default_workspace = "notes",
                    }
                },
            },
        }
    end,
    build = ":Neorg sync-parsers",
    dependencies = "nvim-lua/plenary.nvim",
}
