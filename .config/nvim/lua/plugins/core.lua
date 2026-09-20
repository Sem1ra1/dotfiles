return {
	require("andromeda").setup({
		transparent = false, -- Disable background color
		terminal_colors = true, -- Configure terminal colors

		styles = {
			comments = { italic = true },
			keywords = { italic = true },
			functions = {},
			variables = {},
			floats = "normal", -- "dark" | "transparent" | "normal"
			sidebars = "normal", -- "dark" | "transparent" | "normal"
		},

		plugins = {
			all = true, -- Enable all plugin integrations
			-- Selectively disable plugins:
			-- telescope = false,
			-- neo_tree = false,
		},

		-- Override specific colors
		on_colors = function(colors)
			-- Base color palette
			colors.background = "#23262e" -- Main background
			colors.foreground = "#d5ced9" -- Normal text
			colors.cyan = "#20F5F8" -- Primary accent, identifiers
			colors.pink = "#ff00aa" -- Secondary accent, properties
			colors.purple = "#c74ded" -- Keywords, types
			colors.orange = "#f39c12" -- Numbers
			colors.yellow = "#ffe66d" -- Functions
			colors.magenta = "#f92672" -- Tags, special
			colors.blue = "#7cb7ff" -- Strings (regex)
			colors.red = "#ee5d43" -- Errors, booleans
			colors.green = "#96e072" -- Strings

			-- Background scale
			colors.bg = "#23262e"
			colors.bg_highlight = "#2f323c"
			colors.bg_visual = "#3a3e4b"
			colors.bg_search = "#464959"

			-- Foreground scale
			colors.fg_dark = "#606064"
			colors.fg_gutter = "#81898F"
			colors.fg = "#d5ced9"

			-- Semantic colors
			colors.error = "#ee5d43"
			colors.warning = "#ff7700"
			colors.info = "#47eae0"
			colors.hint = "#12877F"

			-- Git colors
			colors.git_add = "#00ff77"
			colors.git_change = "#47eae0"
			colors.git_delete = "#ff0038"
		end,

		-- Override specific highlights
		on_highlights = function(highlights, colors)
			highlights.Comment = { italic = true }
      highlights.Constant = { fg = colors.red }
      highlights.Title = { fg = colors.foreground } -- html text inside 'title' tag
			highlights.cssTagName = { fg = colors.magenta }
			highlights.cssCascadeProp = { fg = colors.red }
      highlights["@punctuation.special"] = { fg = colors.yellow } -- curly brackets for 'string interpolation'
      highlights["@punctuation.bracket"] = { fg = colors.yellow } -- curly brackets for functions
      highlights["@constant.html"] = { fg = colors.magenta, italic = true  } -- root 'DOCTYPE' tag
      highlights["@keyword.return"] = { fg = colors.magenta, italic = true } -- root 'DOCTYPE' tag
      highlights["@markup.link.label.html"] = { fg = colors.foreground } -- root 'DOCTYPE' tag
      highlights["@string.css"] = { fg = colors.orange } -- root 'DOCTYPE' tag
      highlights["@punctuation.bracket.css"] = { fg = colors.purple } -- root 'DOCTYPE' tag
      highlights["@function.css"] = { fg = colors.orange } -- root 'DOCTYPE' tag
		end,
	}),
}
