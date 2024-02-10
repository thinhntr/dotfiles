return {
  {
    "tpope/vim-fugitive",
    dependencies = "lewis6991/gitsigns.nvim",
    keys = {
      { "<leader>gs", vim.cmd.Git, mode = { "n" } },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    opts = function()
      local git_icons = require("null.misc").icons.git
      return {
        signs = {
          add = { text = git_icons.added },
          change = { text = git_icons.modified },
          delete = { text = git_icons.removed },
          topdelete = { text = git_icons.removed },
          changedelete = { text = git_icons.modified },
        },
      }
    end,
  },
}
