return {
    {
        "tpope/vim-characterize",
        lazy = false,
    },
    {
        "ThePrimeagen/git-worktree.nvim",
        lazy = false,
        config = function()
            require("git-worktree").setup()
            require("telescope").load_extension("git_worktree")
        end
    },
    {
        'numToStr/Comment.nvim',
        lazy = false,
        config = function()
            require('Comment').setup()
        end
    },
    -- {
    --     "petermajn/taskwarrior.nvim",
    --     config = true,
    -- },
    {
        "ThePrimeagen/refactoring.nvim",
        lazy = false,
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-treesitter/nvim-treesitter" }
        },
        config = true,
    },
    {
        "mbbill/undotree",
        keys = {
            { "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle Undotree" },
        },
    },
    "kshenoy/vim-signature",
    "sotte/presenting.vim",
    {
        "iamcco/markdown-preview.nvim",
        lazy = false,
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        lazy = false,
        config = true,
    },
    {
        "rcarriga/nvim-notify",
        event = "VeryLazy",
        enabled = true,
        config = true, -- same as config = true
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
