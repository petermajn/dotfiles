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
                date_format = "%Y-%m-%d",
                -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
                -- template = "daily.md"
            },
            -- Optional, set to true if you don't want obsidian.nvim to manage frontmatter.
            disable_frontmatter = false,
            mappings = {},
            follow_url_func = function(url)
                -- Open the URL in the default web browser.
                vim.fn.jobstart({ "open", url }) -- Mac OS
                -- vim.fn.jobstart({"xdg-open", url})  -- linux
            end,
            -- Optional, customize how names/IDs for new notes are created.
            note_id_func = function(title)
                -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
                -- In this case a note with the title 'My new note' will be given an ID that looks
                -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
                local suffix = ""
                if title ~= nil then
                    -- If title is given, transform it into valid file name.
                    suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
                else
                    -- If title is nil, just add 4 random uppercase letters to the suffix.
                    for _ = 1, 4 do
                        suffix = suffix .. string.char(math.random(65, 90))
                    end
                end
                return tostring(os.time()) .. "-" .. suffix
            end,
            -- Optional, for templates (see below).
            templates = {
                subdir = "templates",
                date_format = "%Y-%m-%d",
                time_format = "%H:%M",
                -- A map for custom variables, the key should be the variable and the value a function
                substitutions = {},
            },
            note_frontmatter_func = function(note)
                -- This is equivalent to the default frontmatter function.
                local out = { id = note.id, aliases = note.aliases, tags = note.tags }
                -- `note.metadata` contains any manually added fields in the frontmatter.
                -- So here we just make sure those fields are kept in the frontmatter.
                if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
                    for k, v in pairs(note.metadata) do
                        out[k] = v
                    end
                end
                return out
            end,
        })
    end,
}
