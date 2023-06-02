return {
      lazy = true,
        "nvim-neorg/neorg",
        -- keys = {
        --     local journal = require("neorg.modules.core.journal.module")
        --     return {
        --         {"<leader>jj", journal.private.diary_today,desc="Journal Today"},
        --         {"<leader>jt", journal.private.diary_tomorrow,desc="Journal Tomorrow"},
        --         {"<leader>jy", journal.private.diary_yesterday,desc="Journal Yesterday"},
        --     }
        -- },
        config = function()
            require('neorg').setup {
                load = {
                    ["core.defaults"] = {}, -- Loads default behaviour
                    ["core.export"] = {}, 
                    ["core.summary"] = {}, 
                    ["core.presenter"] = { -- Adds pretty icons to your documents
                        config = {
                            zen_mode="zen-mode",
                        }
                    }, 
                    ["core.concealer"] = { -- Adds pretty icons to your documents
                        config = {
                            folds=true,
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
