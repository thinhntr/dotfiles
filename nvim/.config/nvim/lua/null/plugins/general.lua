return {
  { "tpope/vim-sleuth" },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        icons_enabled = true,
        theme = "tokyonight",
        component_separators = "",
        section_separators = "",
      },
      sections = {
        lualine_c = {
          "%=",
          {
            "harpoon2",
            indicators = { "1", "2", "3", "4", "5", "6" },
            active_indicators = { "[1]", "[2]", "[3]", "[4]", "[5]", "[6]" },
          },
        },
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

  { "windwp/nvim-autopairs", event = "InsertEnter", config = true },

  -- comment
  { "numToStr/Comment.nvim", opts = {}, event = "VeryLazy" },

  -- file explorer
  {
    "stevearc/oil.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
}
