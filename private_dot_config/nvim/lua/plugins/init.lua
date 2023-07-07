return {
    "kshenoy/vim-signature",
    {
        "mbbill/undotree",
        keys = {
            { "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle Undotree" },
        },
    },
    {
        "tpope/vim-fugitive",
        keys = { { "<leader>gs", vim.cmd.Git, desc = "Git" } },
    },
    "sotte/presenting.vim",
    {
        "iamcco/markdown-preview.nvim",
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufReadPre",
        config = true,
    },
    {
        "rcarriga/nvim-notify",
        event = "VeryLazy",
        enabled = true,
        config = true, -- same as config = true
    },
    {
        'folke/zen-mode.nvim',
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }

    },
    {
        "aserowy/tmux.nvim",
        config = function()
            return require("tmux").setup({
                copy_sync = {
                    -- enables copy sync. by default, all registers are synchronized.
                    -- to control which registers are synced, see the `sync_*` options.
                    enable = false,

                    -- TMUX >= 3.2: all yanks (and deletes) will get redirected to system
                    -- clipboard by tmux
                    redirect_to_clipboard = false,

                    -- overwrites vim.g.clipboard to redirect * and + to the system
                    -- clipboard using tmux. If you sync your system clipboard without tmux,
                    -- disable this option!
                    sync_clipboard = false,

                    -- synchronizes registers *, +, unnamed, and 0 till 9 with tmux buffers.
                    sync_registers = false,
                }
            })
        end
    }

    ---------------------
    -- plugins to test
    -- "sindrets/diffview.nvim"
}
