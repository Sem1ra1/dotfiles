return {
  {
    "saghen/blink.cmp",
    init = function()
      local group = vim.api.nvim_create_augroup("BlinkCmpMenuBorderColor", { clear = true })
      local function set_border_color()
        vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = "#1e2030", bg = "NONE" })
      end
      local function schedule_border_color()
        vim.schedule(set_border_color)
      end

      schedule_border_color()
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = group,
        callback = schedule_border_color,
      })
      vim.api.nvim_create_autocmd("User", {
        group = group,
        pattern = "VeryLazy",
        callback = schedule_border_color,
      })
    end,
    opts = {
      keymap = {
        preset = "default",
        ["<Tab>"] = { "accept", "fallback" },
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      },
      appearance = {
        nerd_font_variant = "mono",
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      completion = {
        trigger = {
          show_on_insert_on_trigger_character = true,
          show_on_accept_on_trigger_character = true,
        },
        menu = {
          auto_show = true,
          draw = { gap = 2 },
          border = "rounded",
          winhighlight = "Normal:Normal,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
        },
        documentation = {
          auto_show = false,
          auto_show_delay_ms = 200,
          window = {
            border = "rounded",
            winhighlight = "Normal:Normal,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
          },
        },
      },
      signature = {
        enabled = true,
        window = {
          border = "rounded",
          winhighlight = "Normal:Normal,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
        },
      },
      fuzzy = {
        implementation = "prefer_rust_with_warning",
      },
    },
  },
  -- Border for signature_help
  {
    "folke/noice.nvim",
    enabled = true,
    opts = {
      views = {
        hover = {
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = {
              Normal = "NoicePopup",
              FloatBorder = "NoicePopupBorder",
            },
          },
        },
      },
      lsp = {
        signature = {
          enabled = false,
        },
        hover = {
          enabled = true,
        },
      },
    },
  },
}
