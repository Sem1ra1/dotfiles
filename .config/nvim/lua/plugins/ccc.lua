return {
  {
    "uga-rosa/ccc.nvim",

    config = function()
      local ccc = require("ccc")

      ccc.setup({
        inputs = {
          ccc.input.hsl,
          ccc.input.rgb,
        },

        highlighter = {
          auto_enable = false,
          filetypes = {
            "css",
            "scss",
            "html",
            "lua",
            "javascript",
            "typescript",
            "javascriptreact",
            "typescriptreact",
          },
        },
      })
    end,

    keys = {
      {
        "<leader>ux",
        "<cmd>CccPick<cr>",
        desc = "Color picker",
      },
    },
  },
}
