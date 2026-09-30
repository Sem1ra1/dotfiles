return {
  "folke/trouble.nvim",
  opts = {
    wrap = true,
  },
  config = function(_, opts)
    local trouble = require("trouble")
    trouble.setup(opts)

    -- Сразу после setup вешаем автокоманду, которая будет включать wrap
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        if vim.bo.filetype == "trouble" then
          vim.opt_local.wrap = true
          vim.opt_local.sidescroll = 0
          vim.opt_local.sidescrolloff = 0
        end
      end,
    })
  end,
}
