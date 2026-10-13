return {
  {
    "ThePrimeagen/harpoon",
    keys = {
      { "<M-1>", function() require("harpoon"):list():select(1) end, desc = "Harpoon to file 1" },
      { "<M-2>", function() require("harpoon"):list():select(2) end, desc = "Harpoon to file 2" },
      { "<M-3>", function() require("harpoon"):list():select(3) end, desc = "Harpoon to file 3" },
      { "<M-4>", function() require("harpoon"):list():select(4) end, desc = "Harpoon to file 4" },
    },
  },
}
