-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.snacks_animate = false
vim.g.autoformat = false
vim.opt.guicursor = "n-v-c-i-sm:block,r-cr-o:hor20"
vim.opt.iskeyword:append("-")
vim.opt.scrolloff = 999  -- or any number you like
vim.opt.swapfile = false
vim.opt.clipboard = "unnamedplus"
