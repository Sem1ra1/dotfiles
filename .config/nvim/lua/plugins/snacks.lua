-- return {
-- 	"folke/snacks.nvim",
--
-- 	opts = {
-- 		picker = {
-- 			sources = {
-- 				files = { hidden = false },
-- 				grep = { hidden = false },
-- 				explorer = { hidden = false },
--
-- 				grep_path = {
-- 					live = true,
--
-- 					finder = function(opts, ctx)
-- 						local grep = require("snacks.picker.source.grep")
--
-- 						local input = ctx.filter.search
--
-- 						-- Формат:
-- 						-- /path/to/dir :: search
-- 						-- ~/path/to/dir :: search
-- 						local path, search = input:match("^%s*(.-)%s*::%s*(.-)%s*$")
--
-- 						if path and search then
-- 							path = vim.fn.expand(path)
--
-- 							if vim.fn.isdirectory(path) == 0 then
-- 								return function()
-- 									vim.schedule(function()
-- 										Snacks.notify.warn("Directory does not exist: " .. path)
-- 									end)
-- 								end
-- 							end
--
-- 							opts.cwd = path
-- 							ctx.filter.search = search
-- 						else
-- 							-- Если :: нет — ищем от текущей директории
-- 							opts.cwd = vim.fn.getcwd()
-- 						end
--
-- 						return grep.grep(opts, ctx)
-- 					end,
-- 				},
-- 			},
-- 		},
-- 	},
--
-- 	keys = {
-- 		{
-- 			"<leader>sg",
-- 			function()
-- 				Snacks.picker.pick("grep_path")
-- 			end,
-- 			desc = "Live Grep",
-- 		},
-- 	},
-- }
--
--
--
-- return {
-- 	"folke/snacks.nvim",
--
-- 	opts = {
-- 		picker = {
-- 			sources = {
-- 				files = {
-- 					hidden = false,
-- 				},
--
-- 				grep = {
-- 					hidden = false,
-- 				},
--
-- 				explorer = {
-- 					hidden = false,
-- 				},
--
-- 				grep_path = {
-- 					live = true,
--
-- 					finder = function(opts, ctx)
-- 						local grep = require("snacks.picker.source.grep")
--
-- 						local input = ctx.filter.search
--
-- 						-- Формат:
-- 						-- /path/to/dir :: search
-- 						-- ~/path/to/dir :: search
-- 						local path, search = input:match(
-- 							"^%s*(.-)%s*::%s*(.-)%s*$"
-- 						)
--
-- 						if path and search then
-- 							path = vim.fn.expand(path)
--
-- 							if vim.fn.isdirectory(path) == 0 then
-- 								return function()
-- 									vim.schedule(function()
-- 										Snacks.notify.warn(
-- 											"Directory does not exist: " .. path
-- 										)
-- 									end)
-- 								end
-- 							end
--
-- 							opts.cwd = path
-- 							ctx.filter.search = search
-- 						else
-- 							-- Без :: ищем от текущей директории
-- 							opts.cwd = vim.fn.getcwd()
-- 						end
--
-- 						return grep.grep(opts, ctx)
-- 					end,
--
-- 					-- Автодополнение пути
-- 					actions = {
-- 						complete_path = function(picker)
-- 							local input = picker.input:get()
--
-- 							-- Автодополнение работает только до ::
-- 							local path_part = input:match("^(.-)%s*::")
--
-- 							if not path_part then
-- 								path_part = input
-- 							end
--
-- 							path_part = vim.trim(path_part)
--
-- 							if path_part == "" then
-- 								path_part = "."
-- 							end
--
-- 							path_part = vim.fn.expand(path_part)
--
-- 							-- Если это уже существующая директория,
-- 							-- показываем её содержимое
-- 							local dir = path_part
-- 							local prefix = ""
--
-- 							if vim.fn.isdirectory(dir) == 0 then
-- 								dir = vim.fn.fnamemodify(path_part, ":h")
-- 								prefix = vim.fn.fnamemodify(path_part, ":t")
-- 							end
--
-- 							if vim.fn.isdirectory(dir) == 0 then
-- 								return
-- 							end
--
-- 							local entries = vim.fn.glob(
-- 								dir .. "/" .. prefix .. "*",
-- 								false,
-- 								true
-- 							)
--
-- 							local directories = {}
--
-- 							for _, entry in ipairs(entries) do
-- 								if vim.fn.isdirectory(entry) == 1 then
-- 									table.insert(directories, entry)
-- 								end
-- 							end
--
-- 							if #directories == 0 then
-- 								return
-- 							end
--
-- 							-- Если найден только один вариант —
-- 							-- сразу подставляем его
-- 							if #directories == 1 then
-- 								local selected = directories[1]
--
-- 								selected = vim.fn.fnamemodify(
-- 									selected,
-- 									":p"
-- 								)
--
-- 								selected = vim.fn.substitute(
-- 									selected,
-- 									"/$",
-- 									"",
-- 									""
-- 								)
--
-- 								local suffix = input:match("(%s*::.*)$") or ""
--
-- 								picker.input:set(
-- 									selected .. suffix
-- 								)
--
-- 								return
-- 							end
--
-- 							-- Несколько вариантов:
-- 							-- выбираем через vim.ui.select
-- 							vim.ui.select(
-- 								directories,
-- 								{
-- 									prompt = "Directory:",
-- 									format_item = function(item)
-- 										return vim.fn.fnamemodify(
-- 											item,
-- 											":~"
-- 										) .. "/"
-- 									end,
-- 								},
-- 								function(choice)
-- 									if not choice then
-- 										return
-- 									end
--
-- 									local selected =
-- 										vim.fn.fnamemodify(
-- 											choice,
-- 											":p"
-- 										)
--
-- 									selected = vim.fn.substitute(
-- 										selected,
-- 										"/$",
-- 										"",
-- 										""
-- 									)
--
-- 									local suffix =
-- 										input:match("(%s*::.*)$") or ""
--
-- 									picker.input:set(
-- 										selected .. suffix
-- 									)
-- 								end
-- 							)
-- 						end,
-- 					},
--
-- 					win = {
-- 						input = {
-- 							keys = {
-- 								["<Tab>"] = {
-- 									"complete_path",
-- 									mode = { "i", "n" },
-- 								},
-- 							},
-- 						},
-- 					},
-- 				},
-- 			},
-- 		},
-- 	},
--
-- 	keys = {
-- 		{
-- 			"<leader>sg",
-- 			function()
-- 				Snacks.picker.pick("grep_path")
-- 			end,
-- 			desc = "Live Grep",
-- 		},
-- 	},
-- }
--
-- ---------------------------------------------------------------------------------
return {
	"folke/snacks.nvim",

	opts = {
		picker = {
			sources = {
				files = {
					hidden = false,
				},

				grep = {
					hidden = false,
				},

				explorer = {
					hidden = false,
				},

				grep_path = {
					live = true,

					finder = function(opts, ctx)
						local grep = require("snacks.picker.source.grep")

						local input = ctx.filter.search

						-- Формат:
						-- /path/to/dir :: search
						-- ~/path/to/dir :: search
						local path, search = input:match(
							"^%s*(.-)%s*::%s*(.-)%s*$"
						)

						if path and search then
							path = vim.fn.expand(path)

							if vim.fn.isdirectory(path) == 0 then
								return function()
									vim.schedule(function()
										Snacks.notify.warn(
											"Directory does not exist: " .. path
										)
									end)
								end
							end

							opts.cwd = path
							ctx.filter.search = search
						else
							-- Без :: ищем от текущей рабочей директории
							opts.cwd = vim.fn.getcwd()
						end

						return grep.grep(opts, ctx)
					end,

					actions = {
						complete_path = function(picker)
							local input = picker.input:get()

							-- Отделяем путь от поискового запроса
							--
							-- ~/.config/hypr :: mirror
							-- ^^^^^^^^^^^^^^^    ^^^^^^
							--      path          search
							local path_part, suffix = input:match(
								"^(.-)%s*::(.*)$"
							)

							if not path_part then
								path_part = input
								suffix = ""
							end

							path_part = vim.trim(path_part)

							if path_part == "" then
								path_part = "."
							end

							-- Раскрываем ~
							local expanded = vim.fn.expand(path_part)

							-- Нормализуем путь
							expanded = vim.fs.normalize(expanded)

							local dir
							local prefix

							if vim.fn.isdirectory(expanded) == 1 then
								-- Например:
								-- ~/
								-- ~/.config/
								--
								-- Показываем содержимое директории
								dir = expanded
								prefix = ""
							else
								-- Например:
								-- ~/.con
								--
								-- dir    = /home/alex
								-- prefix = .con
								dir = vim.fn.fnamemodify(
									expanded,
									":h"
								)

								prefix = vim.fn.fnamemodify(
									expanded,
									":t"
								)
							end

							dir = vim.fs.normalize(dir)

							if vim.fn.isdirectory(dir) == 0 then
								return
							end

							-- Убираем завершающий /
							-- чтобы не получить //
							dir = dir:gsub("/$", "")

							-- Обычные директории
							local entries = vim.fn.glob(
								dir .. "/" .. prefix .. "*",
								false,
								true
							)

							-- Если prefix пустой, добавляем
							-- скрытые директории
							if prefix == "" then
								local hidden_entries = vim.fn.glob(
									dir .. "/.*",
									false,
									true
								)

								for _, entry in ipairs(hidden_entries) do
									table.insert(
										entries,
										entry
									)
								end
							end

							local directories = {}

							for _, entry in ipairs(entries) do
								if vim.fn.isdirectory(entry) == 1 then
									entry = vim.fs.normalize(entry)

									local name =
										vim.fn.fnamemodify(
											entry,
											":t"
										)

									-- Не показываем . и ..
									if name ~= "." and name ~= ".." then
										table.insert(
											directories,
											entry
										)
									end
								end
							end

							if #directories == 0 then
								return
							end

							-- Функция, которая ДОПОЛНЯЕТ уже
							-- введённый пользователем путь.
							local insert_directory = function(choice)
								local name =
									vim.fn.fnamemodify(
										choice,
										":t"
									)

								-- Убираем последний неполный компонент.
								--
								-- ~/.        -> ~/
								-- ~/.con     -> ~/
								-- ~/foo/ba   -> ~/foo/
								local base = path_part:gsub(
									"[^/]*$",
									""
								)

								if base == "" then
									base = "./"
								end

								local new_value =
									base .. name .. "/" .. suffix

								-- ВАЖНО:
								-- grep_path использует live=true,
								-- поэтому второй аргумент — search.
								picker.input:set(
									nil,
									new_value
								)
							end

							-- Если найден только один вариант —
							-- сразу дополняем текущий ввод.
							if #directories == 1 then
								insert_directory(
									directories[1]
								)

								return
							end

							-- Несколько вариантов:
							-- показываем меню выбора.
							vim.ui.select(
								directories,
								{
									prompt = "Directory:",

									format_item = function(item)
										return vim.fn.fnamemodify(
											vim.fs.normalize(item),
											":~"
										) .. "/"
									end,
								},
								function(choice)
									if not choice then
										return
									end

									insert_directory(choice)
								end
							)
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
	},
}--
--
--
