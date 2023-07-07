local M = {}

local servers = {
  sumneko_lua = {
    settings = {
      Lua = {
        workspace = {
          checkThirdParty = false,
        },
        completion = {
          callSnippet = "Replace",
        },
      },
    },
  },
}

function M.setup()
    -- TODO
--    local lsp = require('lsp-zero').preset({})
--
--    lsp.on_attach(function(client, bufnr)
--        lsp.default_keymaps({buffer = bufnr})
--    end)
--
--    -- (Optional) Configure lua language server for neovim
--    require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
--
--    lsp.setup()
end

return M
