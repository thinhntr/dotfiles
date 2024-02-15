return {
  { "tpope/vim-sleuth" },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        icons_enabled = true,
        theme = "tokyonight",
        component_separators = "|",
        section_separators = "",
      },
    },
  },

  {
    "mbbill/undotree",
    lazy = true,
    keys = {
      {
        "<leader>u",
        vim.cmd.UndotreeToggle,
        mode = { "n", "v" },
        desc = "Toggle Undotree",
      },
    },
  },

  {
    "folke/tokyonight.nvim",
    priority = 412049,
    config = function()
      require("tokyonight").setup({ style = "moon" })
      vim.cmd.colorscheme("tokyonight")
    end,
  },

  { "nvim-lua/plenary.nvim", lazy = true },

  -- comment
  { "numToStr/Comment.nvim", opts = {}, keys = "gc" },

  -- file explorer
  {
    "stevearc/oil.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      -- { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
}
