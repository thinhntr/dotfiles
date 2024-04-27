return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = function()
      local harpoon = require("harpoon")
      return {
        {
          "<leader>h",
          function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          mode = { "n" },
          desc = "Harpoon menu",
        },
        {
          "<leader>a",
          function()
            harpoon:list():add()
          end,
          mode = { "n" },
          desc = "Harpoon add",
        },
        {
          "<leader>1",
          function()
            harpoon:list():select(1)
          end,
          mode = { "n" },
        },
        {
          "<leader>2",
          function()
            harpoon:list():select(2)
          end,
          mode = { "n" },
        },
        {
          "<leader>3",
          function()
            harpoon:list():select(3)
          end,
          mode = { "n" },
        },
        {
          "<leader>4",
          function()
            harpoon:list():select(4)
          end,
          mode = { "n" },
        },
        {
          "<leader>5",
          function()
            harpoon:list():select(5)
          end,
          mode = { "n" },
        },
        {
          "<leader>6",
          function()
            harpoon:list():select(6)
          end,
          mode = { "n" },
        },
      }
    end,
  },
  {
    "letieu/harpoon-lualine",
    dependencies = {
      {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
      },
    },
  },
}
