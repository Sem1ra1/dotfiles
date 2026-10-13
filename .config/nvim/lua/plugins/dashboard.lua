return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      for _, key in ipairs(opts.dashboard.preset.keys) do
        if key.key == "s" then
          key.action = ":lua require('persistence').load({ last = true })"
          key.section = nil
          break
        end
      end
    end,
  },
}
