return {
  {
    "folke/snacks.nvim",

    opts = {
      explorer = {
        enabled = true,
      },
    },

    keys = {
      {
        "<leader>e",
        function()
          Snacks.explorer.open({
            cwd = Snacks.git.get_root() or vim.fn.getcwd(),
          })
        end,
        desc = "Explorer (Git Root)",
      },
    },
  },
}
