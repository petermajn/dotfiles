-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use ('wbthomason/packer.nvim')
    use ({
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    })

    use ({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            require('rose-pine').setup({
                --- @usage 'main' | 'moon'
                dark_variant = 'moon',
            })
            vim.cmd('colorscheme rose-pine')
        end
    })

    use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use ('sotte/presenting.vim')
    use ('nvim-treesitter/playground' )
    use ( 'ThePrimeagen/harpoon' )
    use ( 'mbbill/undotree' )
    use ( 'tpope/vim-fugitive' )
    use ({
        'folke/zen-mode.nvim',
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }

    })
    use ({
        "nvim-neorg/neorg",
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
    run = ":Neorg sync-parsers",
    requires = "nvim-lua/plenary.nvim",
}
)
use ({
    'VonHeikemen/lsp-zero.nvim',
    requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'saadparwaiz1/cmp_luasnip'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-nvim-lua'},

        -- Snippets
        {'L3MON4D3/LuaSnip'},
        {'rafamadriz/friendly-snippets'},
    }
})
use ('kshenoy/vim-signature')
use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
})
use({
    "aserowy/tmux.nvim",
    config = function() return require("tmux").setup({
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
    }}
    ) end
})
end)

