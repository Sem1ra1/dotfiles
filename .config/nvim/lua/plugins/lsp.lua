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

  {
    "Jezda1337/nvim-html-css",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      enable_on = { "html" },
      handlers = {
        definition = {
          bind = "gd",
        },
        hover = {
          bind = "K",
          wrap = true,
          border = "none",
          position = "cursor",
        },
      },
      documentation = {
        auto_show = true,
      },
      peek = {
        enabled = true,
        border = "rounded",
        position = "center", -- "center" | "cursor"
        width = 0.5, -- fraction of editor width (0.0–1.0)
        height = 0.5, -- fraction of editor height (0.0–1.0)
        focus = true, -- whether the float steals focus on open
        style = "minimal",
      },
      style_sheets = {},
    },
  },
}
