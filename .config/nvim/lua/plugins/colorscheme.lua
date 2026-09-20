-- return {
-- 	"olimorris/onedarkpro.nvim",
-- 	priority = 1000, -- Ensure it loads first
-- 	lazy = false,
-- }
return {
  "idr4n/andromeda.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("colorscheme andromeda")
  end,
}
