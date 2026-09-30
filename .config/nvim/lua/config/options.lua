vim.g.snacks_animate = false
vim.keymap.set("x", "p", '"_dP', { desc = "Paste without replacing register" })
-- Disable autoformat for lua files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "lua" },
  callback = function()
    vim.b.autoformat = false
  end,
})
