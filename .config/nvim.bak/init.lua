-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- local os = require("os")

-- local path_to_desktop = os.getenv("userprofile") .. "\\desktop"

-- local vim_enter_group = vim.api.nvim_create_augroup("vim_enter_group", { clear = true })

-- vim.api.nvim_create_autocmd(
--     {"vimenter"},
--     { pattern = "*", command = "cd " .. path_to_desktop, group = vim_enter_group }
-- )

-- set root directory as Userprofile
vim.cmd([[
autocmd VimEnter * cd ~
]])


