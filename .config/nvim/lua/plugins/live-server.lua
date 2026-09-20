return {
  "barrett-ruth/live-server.nvim",
  build = "npm install -g live-server", -- or "pnpm add -g live-server"
  cmd = { "LiveServerStart", "LiveServerStop" },
  config = true,
  keys = {
    {
      "<leader>ur",
      "<cmd>LiveServerStart<cr>",
      desc = "Start Live Server",
    },
    {
      "<leader>uq",
      "<cmd>LiveServerStop<cr>",
      desc = "Stop Live Server",
    },
  },
}
