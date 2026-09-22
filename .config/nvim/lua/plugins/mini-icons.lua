return {
  {
    "nvim-mini/mini.icons",
    opts = {
      style = "glyph",

-- Setting up some missing icons
      file = {
        [".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
        [".gitconfig"] = { glyph = "󰊢", hl = "MiniIconsPurple" },
        [".stow-local-ignore"] = { glyph = "󰌷", hl = "MiniIconsGrey" },
        ["nvim"] = { glyph = "󰉋", hl = "MiniIconsAzure" },
        [".config"] = { glyph = "󰉋", hl = "MiniIconsAzure" },
        ["plugins"] = { glyph = "󰉋", hl = "MiniIconsAzure" },
        [".initial_startup_done"] = { glyph = "󰒓", hl = "MiniIconsGrey" },
        ["config"] = { glyph = "󰉋", hl = "MiniIconsAzure" },
        ["UserModules"] = { glyph = "󰉋", hl = "MiniIconsAzure" },
      },

      filetype = {
        dotenv = { glyph = "", hl = "MiniIconsYellow" },
        stow = { glyph = "󰌷", hl = "MiniIconsBlue" },
        node_modules = { glyph = "", hl = "MiniIconsRed" },

      },

      directory = {},
      default = {
        file = { glyph = "󰈔", hl = "MiniIconsGrey", },
        directory = { glyph = "󰉋", hl = "MiniIconsAzure" },
      },
      extension = {
        ["list"] = { glyph = "", hl = "MiniIconsGrey" },
        ["sh"] = { glyph = "", hl = "MiniIconsGrey" },
        ["text"] = { glyph = "", hl = "MiniIconsGrey" },
        ["css"] = { glyph = "", hl = "MiniIconsBlue" },
      },
      lsp       = {},
      os        = {},
    },
  },
}
