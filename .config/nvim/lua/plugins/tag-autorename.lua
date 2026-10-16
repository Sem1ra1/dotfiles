return {
  {
    "windwp/nvim-ts-autotag",
    enabled = false,
  },

  {
    "tronikelis/ts-autotag.nvim",
    opts = {
      {
        opening_node_types = {
          -- templ
          "tag_start",

          -- xml,
          "STag",

          -- html
          "start_tag",

          -- jsx
          "jsx_opening_element",
        },
        identifier_node_types = {
          -- html
          "tag_name",
          "erroneous_end_tag_name",

          -- xml,
          "Name",

          -- jsx
          "member_expression",
          "identifier",

          -- templ
          "element_identifier",
        },

        disable_in_macro = true,

        -- plugin will be initialized on these filetypes
        filetypes = {
          "typescript",
          "javascript",
          "typescriptreact",
          "javascriptreact",
          "xml",
          "html",
          "templ",
          "php",
        },

        auto_close = {
          enabled = true,
        },
        auto_rename = {
          enabled = true,
          closing_node_types = {
            -- jsx
            "jsx_closing_element",

            -- xml,
            "ETag",

            -- html
            "end_tag",
            "erroneous_end_tag",

            -- templ
            "tag_end",
          },
        },
        -- disable plugin on some buffers
        should_attach = function(buf)
          return true
        end,
      },
    },
  },
}
