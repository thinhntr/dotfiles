return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    sort = {
      sorter = "case_sensitive",
    },
    view = {
      width = 30,
    },
    renderer = {
      group_empty = true,
    },
  },
  keys = {
    { "<C-n>", "<Cmd>NvimTreeToggle<CR>", mode = { "n" }, desc = "Toggle nvim-tree" },
  },
}
