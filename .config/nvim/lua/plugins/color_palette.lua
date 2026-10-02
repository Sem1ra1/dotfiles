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

      -- Support named colors (red, green, blue, etc.) by translating the word under
      -- the cursor to a hex code before opening CccPick.
      local named_colors = {
        red = "#ff0000",
        green = "#00ff00",
        blue = "#0000ff",
        black = "#000000",
        white = "#ffffff",
        yellow = "#ffff00",
        cyan = "#00ffff",
        magenta = "#ff00ff",
        gray = "#808080",
        grey = "#808080",
        orange = "#ffa500",
        purple = "#800080",
        brown = "#a52a2a",
      }

      local function open_ccc_with_named_support()
        local word = vim.fn.expand("<cword>")
        local hex = named_colors[word:lower()]
        if hex then
          local start_pos = vim.fn.searchpos("\\<" .. word .. "\\>", "bnW")
          if start_pos[1] ~= 0 then
            local row = start_pos[1] - 1
            local col = start_pos[2] - 1
            local end_col = col + #word
            vim.api.nvim_buf_set_text(0, row, col, row, end_col, { hex })
          end
        end
        vim.cmd("CccPick")
      end

      vim.keymap.set("n", "<leader>ux", open_ccc_with_named_support, { desc = "Color picker" })
    end,

    keys = {
      { "<leader>ux", desc = "Color picker" },
    },
  },
{
  "folke/which-key.nvim",
  opts = {
    spec = {
      {
        "<leader>ux",
        desc = "Color picker",
        icon = "",
      },
    },
  },
},
}
