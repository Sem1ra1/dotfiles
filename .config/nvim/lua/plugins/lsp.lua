return {
  {
    "neovim/nvim-lspconfig",

    opts = {
      servers = {
        vtsls = {
        },
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

        tailwindcss = {
          cmd = {
            "tailwindcss-language-server",
            "--stdio",
          },
        },
      },
    },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "ts_ls",
        "tailwindcss",
      },
    },
  },
}
