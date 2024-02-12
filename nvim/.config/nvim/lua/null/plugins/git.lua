return {
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    keys = { { "<leader>gg", vim.cmd.Git, mode = { "n" }, desc = "vim-fugitive" } },
  },

  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>gp", ":Gitsigns preview_hunk<CR>", mode = { "n" }, desc = "Gitsigns preview_hunk" },
      {
        "<leader>gb",
        "<Cmd>Gitsigns toggle_current_line_blame<CR>",
        mode = { "n" },
        desc = "Gitsigns toggle_current_line_blame",
      },
    },
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
