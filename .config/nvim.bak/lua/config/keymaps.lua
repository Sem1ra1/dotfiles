-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- vim.keymap.del('n', '<leader>ul')
--
-- local map = vim.keymap.set
-- map("n", "<leader>ul", "<cmd>LiveServerStart", { desc = "Start Live Server" })
-- map("n", "<leader>ul", "<cmd>LiveServerStart", { desc = "Start Live Server" })
-- vim.keymap.set("n", "<M-h>", function() harpoon:list():select(1) end)
-- vim.keymap.set("n", "<M-j>", function() harpoon:list():select(2) end)
-- vim.keymap.set("n", "<M-k>", function() harpoon:list():select(3) end)
-- vim.keymap.set("n", "<M-l>", function() harpoon:list():select(4) end)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

vim.keymap.set("i", "<C-n>", function()
	require("blink.cmp").show()
end, { silent = true, desc = "Show completion menu" })
-- make a new line and go onto it
vim.keymap.set("i", "<C-CR>", "<Esc>o")
vim.keymap.set("x", "p", '"_dP', { noremap = true, silent = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true })

-- vim.keymap.set("n", "gx", function()
--   local path = vim.fn.expand("<cfile>")
--   path = vim.fn.expand(path)
--
--   -- URL → открыть обычным системным обработчиком
--   if path:match("^https?://") then
--     vim.ui.open(path)
--     return
--   end
--
--   -- Относительный путь → абсолютный
--   if not path:match("^/") then
--     path = vim.fn.getcwd() .. "/" .. path
--   end
--
--   -- Файл → Kitty + Neovim
--   if vim.fn.filereadable(path) == 1 then
--     vim.fn.jobstart({
--       "/usr/bin/kitty",
--       "nvim",
--       path,
--     }, {
--       detach = true,
--     })
--     return
--   end
--
--   -- Директория → Kitty + Neovim
--   if vim.fn.isdirectory(path) == 1 then
--     vim.fn.jobstart({
--       "/usr/bin/kitty",
--       "--directory",
--       path,
--       "nvim",
--     }, {
--       detach = true,
--     })
--     return
--   end
--
--   -- Всё остальное → стандартный handler
--   vim.ui.open(path)
-- end, { desc = "Open path in Kitty + Neovim" })

vim.keymap.set("n", "gx", function()
  local path = vim.fn.expand("<cfile>")
  path = vim.fn.expand(path)

  -- URL → открыть системным обработчиком
  if path:match("^https?://") then
    vim.ui.open(path)
    return
  end

  -- Относительный путь → абсолютный
  if not path:match("^/") then
    path = vim.fn.getcwd() .. "/" .. path
  end

  -- Файл → открыть в новом буфере текущего Neovim
  if vim.fn.filereadable(path) == 1 then
    vim.cmd("edit " .. vim.fn.fnameescape(path))
    return
  end

  -- Директория → открыть её в новом буфере через netrw
  if vim.fn.isdirectory(path) == 1 then
    vim.cmd("edit " .. vim.fn.fnameescape(path))
    return
  end

  -- Всё остальное → системный handler
  vim.ui.open(path)
end, { desc = "Open path in current Neovim" })
