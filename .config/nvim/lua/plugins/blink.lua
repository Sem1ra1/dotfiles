return {
	-- lazydev
	{
		"saghen/blink.cmp",
		opts = {
			completion = {
				menu = {
					border = "rounded",
					auto_show = false,
				},
				ghost_text = {
					enabled = true,
					show_with_menu = false,
				},
			},

			keymap = {
				-- "super-tab" | "default" | "enter"
				preset = "default",
				-- ["<CR>"] = {},
			},
			sources = {
				providers = {
					lsp = {
						name = "LSP",
						module = "blink.cmp.sources.lsp",
						kind = "LSP",
						score_offset = 0, -- show at a higher priority than lsp
					},
					snippets = {
						name = "Snippets",
						enabled = true,
						module = "blink.cmp.sources.snippets",
						score_offset = 20, -- show at a higher priority than lsp
						should_show_items = function(ctx)
							return ctx.trigger.initial_kind ~= "trigger_character"
						end,
						min_keyword_length = 2,
					},
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 10, -- show at a higher priority than lsp
					},
				},
			},
		},
	},
}
