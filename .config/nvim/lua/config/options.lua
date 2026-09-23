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
vim.opt.guicursor = {
  "n-v-c:block-Cursor",
  "i:block-Cursor",
  "r:block-Cursor",
}

local cursor_colors = {
  n = "#dddddd",
  i = "#00e8c6",
  v = "#cba6f7",
  V = "#cba6f7",
  R = "#f38ba8",
}

vim.api.nvim_create_autocmd("ModeChanged", {
  callback = function()
    local color = cursor_colors[vim.fn.mode()] or "#ffcc66"

    vim.api.nvim_set_hl(0, "Cursor", {
      bg = color,
      fg = "#212733",
    })
  end,
})
