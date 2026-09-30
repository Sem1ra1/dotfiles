return {
	"folke/todo-comments.nvim",
	optional = true,
    -- Turn on hidden files
    keys = {
      { "<leader>st", function() Snacks.picker.todo_comments( { hidden = true }) end, desc = "Todo" },
      { "<leader>sT", function () Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end, desc = "Todo/Fix/Fixme" },
    },
}
