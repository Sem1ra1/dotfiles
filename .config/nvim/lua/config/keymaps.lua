vim.keymap.set("n", "<leader>m", "<cmd>source % <CR>", {desc = "Source current file"})

-- Enter for html-like tags
local function smart_enter()
  local node = vim.treesitter.get_node()

  while node do
    local type = node:type()

    if type == "element" or type == "jsx_element" then
      local row, col = unpack(vim.api.nvim_win_get_cursor(0))
      local line = vim.api.nvim_get_current_line()

      local before = line:sub(1, col)
      local after = line:sub(col + 1)

      -- If cursor placed between <tag> and </tag>
      if before:match(">%s*$") and after:match("^%s*</") then
        local base_indent = line:match("^%s*") or ""
        local child_indent = base_indent .. string.rep(" ", vim.bo.shiftwidth)
        local closing_tag = after:gsub("^%s*", "")

        vim.api.nvim_buf_set_lines(0, row - 1, row, false, {
          before,
          child_indent,
          base_indent .. closing_tag,
        })

        vim.api.nvim_win_set_cursor(0, {
          row + 1,
          #child_indent,
        })

        return
      end

      break
    end

    node = node:parent()
  end

  vim.api.nvim_feedkeys(
    vim.api.nvim_replace_termcodes("<CR>", true, false, true),
    "n",
    false
  )
end

vim.keymap.set("i", "<CR>", smart_enter, {
  desc = "Smart HTML enter",
})
