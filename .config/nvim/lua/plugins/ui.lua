return {
	{
		"folke/noice.nvim",
		opts = function(_, opts)
			opts.presets.lsp_doc_border = true
		end,
	},
{
		"folke/noice.nvim",
		opts = function(_, opts)
			table.insert(opts.routes, {
				filter = {
					event = "notify",
					find = "No information available",
				},
				opts = { skip = true },
			})
			local focused = true
			vim.api.nvim_create_autocmd("FocusGained", {
				callback = function()
					focused = true
				end,
			})
			vim.api.nvim_create_autocmd("FocusLost", {
				callback = function()
					focused = false
				end,
			})
			table.insert(opts.routes, 1, {
				filter = {
					cond = function()
						return not focused
					end,
				},
				view = "notify_send",
				opts = { stop = false },
			})

			opts.commands = {
				all = {
					-- options for the message history that you get with `:Noice`
					view = "split",
					opts = { enter = true, format = "details" },
					filter = {},
				},
			}

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "markdown",
				callback = function(event)
					vim.schedule(function()
						require("noice.text.markdown").keys(event.buf)
					end)
				end,
			})

			opts.presets.lsp_doc_border = true
		end,
	},

	{
		"nvim-lspconfig",
		opts = {
			inlay_hints = { enabled = false },
		},

		-- {
		-- 	"brenoprata10/nvim-highlight-colors",
		-- 	event = "BufReadPre",
		-- 	opts = {
		-- 		--'background'|'foreground'|'virtual'
		-- 		render = "virtual",
		--       virtual_symbol_position = "eow",
		--
		-- 		-- "●"|"♫"|"✦"|"▁▂▃▄▅▆▇█ █▇▆▅▄▃▂▁"|"◀■▶"|"●"
		-- 		virtual_symbol = "●",
		-- 		virtual_symbol_prefix = " ",
		-- 		virtual_symbol_suffix = "",
		--
		-- 		enable_hex = true,
		-- 		enable_short_hex = true,
		-- 		enable_rgb = true,
		-- 		enable_hsl = true,
		-- 		enable_hsl_without_function = true,
		-- 		enable_ansi = true,
		-- 		enable_var_usage = true,
		-- 		enable_tailwind = true,
		-- 	},
		-- },
	},
}
