return { "folke/snacks.nvim",
	opts = {
		picker = {
			sources = {
				files = {
					hidden = true,
				},

				grep = {
					hidden = true,
				},

				explorer = {
					hidden = true,
				},

				grep_path = {
					live = true,

					finder = function(opts, ctx)
						local grep = require("snacks.picker.source.grep")

						local input = ctx.filter.search

						-- Format:
						-- /path/to/dir :: search
						-- ~/path/to/dir :: search
						local path, search = input:match("^%s*(.-)%s*::%s*(.-)%s*$")

						if path and search then
							path = vim.fn.expand(path)

							if vim.fn.isdirectory(path) == 0 then
								return function()
									vim.schedule(function()
										Snacks.notify.warn("Directory does not exist: " .. path)
									end)
								end
							end

							opts.cwd = path
							ctx.filter.search = search
						else
							-- Without :: search results
							opts.cwd = vim.fn.getcwd()
						end

						return grep.grep(opts, ctx)
					end,

					actions = {
						complete_path = function(picker)
							local input = picker.input:get()

							-- Sintax separation
							-- ~/.config/hypr :: mirror
							--      path          search
							local path_part, suffix = input:match("^(.-)%s*::(.*)$")

							if not path_part then
								path_part = input
								suffix = ""
							end

							path_part = vim.trim(path_part)

							if path_part == "" then
								path_part = "."
							end

							local expanded = vim.fn.expand(path_part)

							expanded = vim.fs.normalize(expanded)

							local dir
							local prefix

							if vim.fn.isdirectory(expanded) == 1 then
								dir = expanded
								prefix = ""
							else
								dir = vim.fn.fnamemodify(expanded, ":h")

								prefix = vim.fn.fnamemodify(expanded, ":t")
							end

							dir = vim.fs.normalize(dir)

							if vim.fn.isdirectory(dir) == 0 then
								return
							end

							dir = dir:gsub("/$", "")

							local entries = vim.fn.glob(dir .. "/" .. prefix .. "*", false, true)

							if prefix == "" then
								local hidden_entries = vim.fn.glob(dir .. "/.*", false, true)

								for _, entry in ipairs(hidden_entries) do
									table.insert(entries, entry)
								end
							end

							local directories = {}

							for _, entry in ipairs(entries) do
								if vim.fn.isdirectory(entry) == 1 then
									entry = vim.fs.normalize(entry)

									local name = vim.fn.fnamemodify(entry, ":t")

									if name ~= "." and name ~= ".." then
										table.insert(directories, entry)
									end
								end
							end

							if #directories == 0 then
								return
							end

							-- Function for autocompletion path typed by user
							local insert_directory = function(choice)
								local name = vim.fn.fnamemodify(choice, ":t")

								-- Cleanup
								--
								-- ~/.        -> ~/
								-- ~/.con     -> ~/
								-- ~/foo/ba   -> ~/foo/
								local base = path_part:gsub("[^/]*$", "")

								if base == "" then
									base = "./"
								end

								local new_value = base .. name .. "/" .. suffix

								picker.input:set(nil, new_value)
							end

							--  For 1 result complete without asking
							if #directories == 1 then
								insert_directory(directories[1])

								return
							end

							vim.ui.select(directories, {
								prompt = "Directory:",

								format_item = function(item)
									return vim.fn.fnamemodify(vim.fs.normalize(item), ":~") .. "/"
								end,
							}, function(choice)
								if not choice then
									return
								end

								insert_directory(choice)
							end)
						end,
					},

					win = {
						input = {
							keys = {
								["<Tab>"] = {
									"complete_path",
									mode = { "i", "n" },
								},
							},
						},
					},
				},
			},
		},
	},

	keys = {
		{
			"<leader>sg",
			function()
				Snacks.picker.pick("grep_path")
			end,
			desc = "Live Grep",
		},
		{
			"<leader>gs",
			function()
				Snacks.picker.git_status({
					cwd = LazyVim.root.git(),
				})
			end,
			desc = "Git Status",
		},
	},
} --
--
--
