return {
  {
    "saghen/blink.cmp",
    version = "v1.*",
    event = { "BufReadPre", "BufNewFile", "InsertEnter" },
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = {
      keymap = {
        preset = "default",
        ["<Tab>"] = { "accept", "fallback" },
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      },
      appearance = {
        nerd_font_variant = "mono",
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      completion = {
        trigger = {
          show_on_insert_on_trigger_character = true,
          show_on_accept_on_trigger_character = true,
        },
        menu = {
          auto_show = true,
          border = "rounded",
        },
        documentation = {
          auto_show = false,
          auto_show_delay_ms = 200,
          window = { border = "rounded" },
        },
      },
      signature = {
        enabled = true,
        window = { border = "rounded" },
      },
      fuzzy = {
        implementation = "prefer_rust_with_warning",
      },
    },
    opts_extend = { "sources.default" },
  },

  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate" },
    config = true,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        "bashls",
        "cssls",
        "html",
        "jsonls",
        "lua_ls",
        "pyright",
        "ts_ls",
        "yamlls",
        "emmet_language_server"
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "saghen/blink.cmp",
    },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      local servers = {
        bashls = {},
        cssls = {},
        html = {},
        jsonls = {},
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { "vim", "Snacks", "LazyVim" } },
              workspace = { checkThirdParty = false },
            },
          },
        },
        pyright = {},
        ts_ls = {},
        yamlls = {},
      }

      for server_name, server_opts in pairs(servers) do
        local opts = vim.tbl_deep_extend("force", { capabilities = capabilities }, server_opts)
        vim.lsp.config(server_name, opts)
        vim.lsp.enable(server_name)
      end

      local diagnostic_icons = {
        [vim.diagnostic.severity.ERROR] = "✘",
        [vim.diagnostic.severity.WARN] = "▲",
        [vim.diagnostic.severity.INFO] = "●",
        [vim.diagnostic.severity.HINT] = "◆",
      }

      vim.diagnostic.config({
        virtual_text = {
          spacing = 15,
          source = "if_many",
          prefix = function(diagnostic)
            return diagnostic_icons[diagnostic.severity] or "●"
          end,
        },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = diagnostic_icons[vim.diagnostic.severity.ERROR],
            [vim.diagnostic.severity.WARN] = diagnostic_icons[vim.diagnostic.severity.WARN],
            [vim.diagnostic.severity.INFO] = diagnostic_icons[vim.diagnostic.severity.INFO],
            [vim.diagnostic.severity.HINT] = diagnostic_icons[vim.diagnostic.severity.HINT],
          },
        },
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = "rounded",
          source = "if_many",
          header = "",
          prefix = "",
        },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("user_lsp_config", { clear = true }),
        callback = function(args)
          local bufnr = args.buf
          local opts = { buffer = bufnr, remap = false, silent = true }

          vim.keymap.set("n", "K",          function() vim.lsp.buf.hover({ border = "rounded", max_width = 80 }) end, vim.tbl_extend("force", opts, { desc = "Hover documentation" }))
          vim.keymap.set("n", "<leader>ck", function() vim.lsp.buf.signature_help({ border = "rounded", max_width = 80 }) end, vim.tbl_extend("force", opts, { desc = "Signature help" }))
          vim.keymap.set("n", "<leader>cf", function() vim.lsp.buf.format({ async = true }) end, vim.tbl_extend("force", opts, { desc = "Format buffer" }))
          vim.keymap.set("n", "<leader>uh", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr }) end, vim.tbl_extend("force", opts, { desc = "Toggle inlay hints" }))
          vim.keymap.set("n", "<leader>cr",          vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename symbol" }))
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code action" }))

          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client:supports_method("textDocument/documentHighlight", bufnr) then
            local highlight_group = vim.api.nvim_create_augroup("user_lsp_document_highlight_" .. bufnr, { clear = true })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              group = highlight_group,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.document_highlight()
              end,
            })
            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              group = highlight_group,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.clear_references()
              end,
            })
          end
        end,
      })
    end,
  },
}
