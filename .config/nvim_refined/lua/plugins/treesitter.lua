return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "TSInstall", "TSLog", "TSUninstall", "TSUpdate" },
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      folds = { enable = true },
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "printf",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      },
    },
    config = function(_, opts)
      local treesitter = require("nvim-treesitter")
      treesitter.setup()
      treesitter.install(opts.ensure_installed)

      local group = vim.api.nvim_create_augroup("user_treesitter", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        group = group,
        callback = function(args)
          local buf = args.buf
          if vim.bo[buf].buftype ~= "" then
            return
          end

          local filetype = args.match
          local language = vim.treesitter.language.get_lang(filetype)
          if not language then
            return
          end
          if not pcall(vim.treesitter.language.inspect, language) then
            return
          end

          local function feature_enabled(feature)
            local config = opts[feature] or {}
            return config.enable ~= false
              and not (type(config.disable) == "table" and vim.tbl_contains(config.disable, language))
          end

          if feature_enabled("highlight") then
            -- Parser installation runs asynchronously, so it may not be available yet.
            local started = pcall(vim.treesitter.start, buf, language)
            if not started then
              return
            end
          end

          if feature_enabled("indent") then
            vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end

          if feature_enabled("folds") then
            vim.wo.foldmethod = "expr"
            vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          end
        end,
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    event = "VeryLazy",
    opts = {
      move = {
        enable = true,
        set_jumps = true,
      },
    },
    config = function(_, opts)
      require("nvim-treesitter-textobjects").setup(opts)

      local moves = {
        goto_next_start = {
          ["]f"] = "@function.outer",
          ["]c"] = "@class.outer",
          ["]a"] = "@parameter.inner",
        },
        goto_next_end = {
          ["]F"] = "@function.outer",
          ["]C"] = "@class.outer",
          ["]A"] = "@parameter.inner",
        },
        goto_previous_start = {
          ["[f"] = "@function.outer",
          ["[c"] = "@class.outer",
          ["[a"] = "@parameter.inner",
        },
        goto_previous_end = {
          ["[F"] = "@function.outer",
          ["[C"] = "@class.outer",
          ["[A"] = "@parameter.inner",
        },
      }

      local move = require("nvim-treesitter-textobjects.move")
      local group = vim.api.nvim_create_augroup("user_treesitter_textobjects", { clear = true })
      local function attach(buf)
        if vim.bo[buf].buftype ~= "" then
          return
        end

        local language = vim.treesitter.language.get_lang(vim.bo[buf].filetype)
        if not language or not pcall(vim.treesitter.query.get, language, "textobjects") then
          return
        end

        for method, keymaps in pairs(moves) do
          for key, query in pairs(keymaps) do
            vim.keymap.set({ "n", "x", "o" }, key, function()
              if vim.wo.diff and key:find("[cC]") then
                return vim.cmd("normal! " .. key)
              end
              move[method](query, "textobjects")
            end, {
              buffer = buf,
              desc = (key:sub(1, 1) == "[" and "Previous " or "Next ")
                .. query:gsub("@", ""):gsub("%..*", "")
                .. (key:sub(2, 2) == key:sub(2, 2):upper() and " End" or " Start"),
              silent = true,
            })
          end
        end
      end

      vim.api.nvim_create_autocmd("FileType", {
        group = group,
        callback = function(args)
          attach(args.buf)
        end,
      })
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) then
          attach(buf)
        end
      end
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {},
  },
}
