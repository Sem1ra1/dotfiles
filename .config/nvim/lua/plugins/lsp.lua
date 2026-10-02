return {
  {
    "neovim/nvim-lspconfig",

    opts = {
      -- LSP Server Settings
      -- Sets the default configuration for an LSP client (or all clients if the special name "*" is used).
      servers = {
        -- configuration for all lsp servers
        stylua = { enabled = false },
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim", "Snacks", "LazyVim" },
              },
              workspace = {
                checkThirdParty = false,
              },
              codeLens = {
                enable = true,
              },
              completion = {
                callSnippet = "Replace",
              },
              doc = {
                privateName = { "^_" },
              },
              hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = "Disable",
                semicolon = "Disable",
                arrayIndex = "Disable",
              },
            },
          },
        },
      },
    },
  },

  {
   "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "ts_ls"
      }
    }
  }
}
