local function project_root()
  local root = vim.fs.root(0, { ".git" }) or vim.fn.getcwd()
  local name = vim.fn.fnamemodify(root, ":t")
  return name ~= "" and (" " .. name) or ""
end

local function git_diff()
  local status = vim.b.gitsigns_status_dict
  if not status then
    return nil
  end
  return {
    added = status.added,
    modified = status.changed,
    removed = status.removed,
  }
end

return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
      { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
      { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
      { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
      { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
      { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
      { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
      { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
      { "<leader>bj", "<cmd>BufferLinePick<cr>", desc = "Pick Buffer" },
    },
    opts = {
      options = {
        always_show_bufferline = true,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
          { filetype = "snacks_layout_box" },
        },
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "echasnovski/mini.nvim" },
    init = function()
      vim.api.nvim_create_autocmd("VimEnter", {
        once = true,
        callback = function()
          vim.g.lualine_laststatus = vim.o.laststatus
          if vim.fn.argc(-1) > 0 then
            vim.o.statusline = " "
          else
            vim.o.laststatus = 0
          end
        end,
      })
    end,
    opts = function()
      local lualine_require = require("lualine_require")
      lualine_require.require = require

      local icons = {
        diagnostics = {
          Error = " ",
          Warn = " ",
          Info = " ",
          Hint = " ",
        },
        git = {
          added = " ",
          modified = " ",
          removed = " ",
        },
      }

      vim.o.laststatus = vim.g.lualine_laststatus or vim.o.laststatus

      local opts = {
        options = {
          theme = "auto",
          globalstatus = vim.o.laststatus == 3,
          disabled_filetypes = {
            statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" },
          },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = {
            {
              project_root,
              color = { fg = "#82aaff" },
            },
            {
              function()
                local filetype = vim.bo.filetype
                if filetype == "" then
                  return ""
                end
                return require("mini.icons").get("filetype", filetype)
              end,
              color = function()
                local filetype = vim.bo.filetype
                if filetype == "" then
                  return nil
                end
                local _, highlight = require("mini.icons").get("filetype", filetype)
                return highlight
              end,
              separator = "",
              padding = { left = 1, right = 0 },
            },
            {
              "filename",
              symbols = { modified = " [+]", readonly = " ", unnamed = "[No Name]" },
            },
          },
          lualine_x = {
            Snacks.profiler.status(),
            {
              function()
                return require("noice").api.status.command.get()
              end,
              cond = function()
                return package.loaded["noice"] and require("noice").api.status.command.has()
              end,
              color = function()
                return { fg = Snacks.util.color("Statement") }
              end,
            },
            {
              function()
                return require("noice").api.status.mode.get()
              end,
              cond = function()
                return package.loaded["noice"] and require("noice").api.status.mode.has()
              end,
              color = function()
                return { fg = Snacks.util.color("Constant") }
              end,
            },
            {
              function()
                return "  " .. require("dap").status()
              end,
              cond = function()
                return package.loaded["dap"] and require("dap").status() ~= ""
              end,
              color = function()
                return { fg = Snacks.util.color("Debug") }
              end,
            },
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = function()
                return { fg = Snacks.util.color("Special") }
              end,
            },
            {
              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
              source = git_diff,
            },
          },
          lualine_y = {
            { "progress", separator = " ", padding = { left = 1, right = 0 } },
            { "location", padding = { left = 0, right = 1 } },
          },
          lualine_z = {
            function()
              return " " .. os.date("%R")
            end,
          },
        },
        extensions = { "neo-tree", "lazy", "fzf" },
      }

      if vim.g.trouble_lualine then
        local ok, trouble = pcall(require, "trouble")
        if ok then
          local symbols = trouble.statusline({
            mode = "symbols",
            groups = {},
            title = false,
            filter = { range = true },
            format = "{kind_icon}{symbol.name:Normal}",
            hl_group = "lualine_c_normal",
          })
          table.insert(opts.sections.lualine_c, {
            symbols and symbols.get,
            cond = function()
              return vim.b.trouble_lualine ~= false and symbols.has()
            end,
          })
        end
      end

      return opts
    end,
  },
}
