return {
  {
    "folke/snacks.nvim",
    opts = {
      lazygit = {
        enabled = true,
      },
    },
    keys = {
      {
        "<leader>gg",
        function()
          Snacks.lazygit({ cwd = Snacks.git.get_root(0) or vim.fn.getcwd() })
        end,
        desc = "Lazygit (current project)",
      },
    },
  },
}
