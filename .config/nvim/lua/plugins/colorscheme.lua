return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night",
      transparent = false,
-- TODO: need to change variables, not highlight groups - for consistent color palette
-- TODO: Fix lazy.git borders/text
      on_colors = function(colors)
        -- Backgrounds
        colors.bg = "#1a1b26"
        -- colors.bg_dark = "#16161e"
        colors.bg_dark = "#1a1b26"
        colors.bg_dark1 = "#0C0E14"
        -- colors.bg_float = "#16161e"
        colors.bg_float = "#1a1b26"
        -- colors.bg_popup = "#16161e"
        colors.bg_popup = "#1a1b26"
        colors.bg_sidebar = "#16161e"
        colors.bg_statusline = "#16161e"
        colors.bg_highlight = "#292e42"
        colors.bg_visual = "#283457"
        colors.bg_search = "#3d59a1"

        -- Foregrounds
        colors.fg = "#c0caf5"
        colors.fg_dark = "#a9b1d6"
        colors.fg_float = "#c0caf5"
        colors.fg_sidebar = "#a9b1d6"
        colors.fg_gutter = "#3b4261"

        -- Blue
        colors.blue = "#7aa2f7"
        colors.blue0 = "#3d59a1"
        colors.blue1 = "#2ac3de"
        colors.blue2 = "#0db9d7"
        colors.blue5 = "#89ddff"
        colors.blue6 = "#b4f9f8"
        colors.blue7 = "#394b70"

        -- Cyan / Teal
        colors.cyan = "#7dcfff"
        colors.teal = "#1abc9c"
        colors.green2 = "#41a6b5"
        colors.green1 = "#73daca"

        -- Green
        colors.green = "#9ece6a"

        -- Red
        colors.red = "#f7768e"
        colors.red1 = "#db4b4b"

        -- Orange / Yellow
        colors.orange = "#ff9e64"
        colors.yellow = "#e0af68"

        -- Purple / Magenta
        colors.purple = "#9d7cd8"
        colors.magenta = "#bb9af7"
        colors.magenta2 = "#ff007c"

        -- Neutral / Dark
        colors.black = "#15161e"
        colors.dark3 = "#545c7e"
        colors.dark5 = "#737aa2"
        colors.comment = "#565f89"
        colors.terminal_black = "#414868"

        -- Borders
        colors.border = "#15161e"
        colors.border_highlight = "#27a1b9"

        -- Diagnostics / semantic
        colors.error = "#db4b4b"
        colors.warning = "#e0af68"
        colors.info = "#0db9d7"
        colors.hint = "#1abc9c"
        colors.todo = "#7aa2f7"

        -- Special
        colors.none = "NONE"
      end,

      on_highlights = function(hl, c)
        hl.SnacksPickerInputBorder = {
          fg = "NONE",
        }
        -- hl.SnacksPickerInputTitle = {
        --   bg = "NONE",
        --   fg = "NONE",
        -- }
        --
        hl.DiagnosticUnnecessary = {
          fg = "#8b97cd",
        }

        -- Doesn't work
        hl.BlinkCmpMenu = {
          fg = "#f7768e",
          bg = "#85ad5b",
        }

        hl.BlinkCmpMenuBorder = {
          fg = "#16161e",
          bg = "#1a1b26",
        }

        hl.BlinkCmpScrollBarThumb = {
          bg = "#16161e",
        }

        hl.BlinkCmpDocSeparator = {
          bg = "#1a1b26",
        }

        hl.NormalFloat = {
          fg = c.fg,
          bg = "#1a1b26",
        }

        -- Рамка
        hl.FloatBorder = {
          -- fg = "#16161e",
          bg = "#1a1b26",
        }

        hl.BlinkCmpSignatureHelpActiveParameter = {
          -- fg = "#ebebeb",
          bg = "#373d58",
        }
        -- File names inside picker
        -- hl.SnacksPickerFile = {
        --   fg = "#f7768e",
        --   bg = "#85ad5b"
        -- }
        hl.SnacksPickerBoxBorder = {
          fg = "#356e78",
          bg = "#1a1b26",
        }

        hl.SnacksPickerBoxTitle = {
          bg = "#1a1b26",
        }

        hl.SnacksPickerPreviewTitle = {
          bg = "#1a1b26",
        }

        hl.SnacksPickerInputTitle = {
          bg = "#1a1b26",
        }

        hl.SnacksPickerPreviewBorder = {
          fg = "#356e78",
          bg = "#1a1b26",
        }

        hl.SnacksPickerInputTitle = {
          bg = "#1a1b26",
        }

        hl.WhichKeyNormal = {
          bg = "#1a1b26",
        }

        hl.WhichKeyTitle = {
          bg = "#1a1b26",
        }
      end,
    },
  },
}
