return {
  {
    "saghen/blink.cmp",
    init = function()
      local group = vim.api.nvim_create_augroup("BlinkCmpMenuBorderColor", { clear = true })
      local function set_border_color()
        vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = "#1e2030", bg = "NONE" })
      end

      set_border_color()
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = group,
        callback = set_border_color,
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
          border = "rounded",
          winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
        },
        documentation = {
          auto_show = false,
          auto_show_delay_ms = 200,
          window = { border = "rounded" },
        },
      },
      signature = {
        enabled = false,
        window = { border = "rounded" },
      },
      fuzzy = {
        implementation = "prefer_rust_with_warning",
      },
    },
  },
  -- Border for signature_help
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
    },
  },
}
