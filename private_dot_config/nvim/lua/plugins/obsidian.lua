return {
    "epwalsh/obsidian.nvim",
    enabled = true,
    lazy = false,
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",

    },
    keys = {
        { "<leader>of", "<cmd>ObsidianFollowLink<cr>",  desc = "[O]bsidian[F}ollowLink" },
        { "<leader>ob", "<cmd>ObsidianBacklinks<cr>",   desc = "[O]bsidian[B]acklinks" },
        { "<leader>ot", "<cmd>ObsidianToday<cr>",       desc = "[O]bsidian[T]oday" },
        { "<leader>oy", "<cmd>ObsidianYesterday<cr>",   desc = "[O]bsidian[Y]esterday" },
        { "<leader>oq", "<cmd>ObsidianQuickSwitch<cr>", desc = "[O]bsidian[Q]uickSwitch" },
    },
    config = function()
        require("obsidian").setup({
            dir = "~/notes", -- no need to call 'vim.fn.expand' here
            daily_notes = {
                -- Optional, if you keep daily notes in a separate directory.
                folder = "/daily",
                -- Optional, if you want to change the date format for daily notes.
                date_format = "%Y-%m-%d"
            },
            -- Optional, set to true if you don't want obsidian.nvim to manage frontmatter.
            disable_frontmatter = true,
            mappings = {},
            follow_url_func = function(url)
                -- Open the URL in the default web browser.
                vim.fn.jobstart({ "open", url }) -- Mac OS
                -- vim.fn.jobstart({"xdg-open", url})  -- linux
            end,

        })
    end,
}
