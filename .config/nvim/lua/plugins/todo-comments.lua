return {
	"folke/todo-comments.nvim",
	optional = true,
    -- Turn on hidden files
    keys = {
      { "<leader>st", function() Snacks.picker.todo_comments( { hidden = true, cwd = LazyVim.root() }) end, desc = "Todo" },
      { "<leader>sT", function () Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" }, cwd = LazyVim.root() }) end, desc = "Todo/Fix/Fixme" },
    },
}
