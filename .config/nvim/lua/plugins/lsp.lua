return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        html = {},
        cssls = {
          enabled = false,
        },
        somesass_ls = {
          filetypes = { "css", "scss", "sass" },
          settings = {
            somesass = {
              scss = {
                completion = {
                  mixinStyle = "nobracket",
                },
              },
            },
          },
        },
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim", "Snacks", "LazyVim" },
              },
            },
          },
        },
      },
    },
  },
}
