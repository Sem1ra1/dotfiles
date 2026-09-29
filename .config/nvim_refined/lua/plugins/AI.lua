return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<M-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      panel = { enabled = false },
    },
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      "zbirenbaum/copilot.lua",
      "nvim-lua/plenary.nvim",
    },
    cmd = {
      "CopilotChat",
      "CopilotChatToggle",
      "CopilotChatExplain",
      "CopilotChatFix",
      "CopilotChatReview",
    },
    opts = {
      window = {
        layout = "float",
        width = 0.8,
        height = 0.8,
        border = "rounded",
      },
    },
    keys = {
      { "<leader>aa", "<cmd>CopilotChatToggle<cr>", desc = "Toggle Copilot Chat" },
      { "<leader>ae", "<cmd>CopilotChatExplain<cr>", mode = { "n", "v" }, desc = "Explain code" },
      { "<leader>af", "<cmd>CopilotChatFix<cr>", mode = { "n", "v" }, desc = "Fix code" },
      { "<leader>ar", "<cmd>CopilotChatReview<cr>", mode = { "n", "v" }, desc = "Review code" },
    },
  },
}
