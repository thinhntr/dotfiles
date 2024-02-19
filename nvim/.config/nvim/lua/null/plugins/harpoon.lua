return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
  keys = function()
    local harpoon = require("harpoon")
    return {
      {
        "<C-p>",
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        mode = { "n" },
        desc = "Harpoon menu",
      },
      {
        "<leader>a",
        function()
          harpoon:list():append()
        end,
        mode = { "n" },
        desc = "Harpoon append",
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
    }
  end,
}
