return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        cssls = {
          enabled = false,
        },
        somesass_ls = {
          filetypes = { "css", "scss", "sass" },
        },
      },
    },
  },
}

