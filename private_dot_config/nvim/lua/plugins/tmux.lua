return {
    "aserowy/tmux.nvim",
    lazy = false,
    config = function() return require("tmux").setup {
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
    }
    end
}
