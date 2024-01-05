return {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    cmd = "Telescope",
    keys = {
        { "<leader><space>", "<cmd>Telescope find_files<cr>",             desc = "[F]ind [F]iles" },
        { "<leader>ff",      "<cmd>Telescope find_files no_ignore=true<cr>",             desc = "[F]ind [F]iles" },
        { "<leader>ffh",     "<cmd>Telescope find_files hidden=true<cr>", desc = "[F]ind [F]iles [H]idden" },
        { "<leader>fr",      "<cmd>Telescope oldfiles<cr>",               desc = "[F]ind [R]ecent" },
        { "<leader>fb",      "<cmd>Telescope buffers<cr>",                desc = "[F]ind [B]uffers" },
        { "<leader>fg",      "<cmd>Telescope git_files<cr>",              desc = "[F]ind [G]it Files" },
        { "<leader>f/",      "<cmd>Telescope live_grep<cr>",              desc = "Grep" },
        {
            "<leader>ft",
            function() require("telescope.builtin").grep_string({ search = "- [ ]" }) end,
            desc = "[F]ind [T]asks",
        },
        {
            "<leader>fc",
            function() require("telescope.builtin").find_files({ cwd = "~/.config", hidden = true }) end,
            desc = "[F]ind [C]onfig",
        },
        -- vim.keymap.set('n', '<leader>psw', builtin.grep_string, {})
        -- vim.keymap.set('n', '<leader>ps', function()
        --     builtin.grep_string({ search = vim.fn.input("Grep > ") })
        -- end)
    },
    config = true,
}
