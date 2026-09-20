return {
	"folke/flash.nvim",
	enabled = true,
	event = "VeryLazy",
	keys = {
	  { "<M-space>", mode = { "n", "o", "x" },
	    function()
	      require("flash").treesitter({
	        actions = {
	          ["<M-space>"] = "next",
	          ["<BS>"] = "prev"
	        }
	      })
	    end, desc = "Treesitter Incremental Selection" },
	},
}
