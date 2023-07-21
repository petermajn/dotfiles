return {
    {
        "sindrets/diffview.nvim",
        cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
        config = true,
    },
    {
        "TimUntersberger/neogit",
        cmd = "Neogit",
        opts = {
            integrations = { diffview = true },
        },
        keys = {
            { "<leader>gs", "<cmd>Neogit kind=tab<cr>", desc = "Status" },
        },
    },

}
