return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "default",
        -- ["<Tab>"] = { "accept", "fallback" },
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      },
      appearance = {
        nerd_font_variant = "mono",
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        providers = {
          -- Don't show duplicates for path autocompletions from both sources: LSP and Path. Exclude LSP sourse
          lsp = {
            should_show_items = function(context)
              local before_current_word = context.line:sub(1, context.bounds.start_col - 1)
              return before_current_word:sub(-1) ~= "/"
            end,
          },
          snippets = {
          },
        },
      },
      completion = {
        trigger = {
          show_on_insert_on_trigger_character = true,
          show_on_accept_on_trigger_character = true,
        },
        ghost_text = {
          enabled = true,
        },
        menu = {
          auto_show = true,
          draw = {
            -- padding = {0, 1},
            cursorline_priority = 0,
            gap = 2,
            columns = {
              { "kind_icon" },
              { "label", "label_description", gap = 1 },
              { "kind", "source_name" },
            },
          },
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
