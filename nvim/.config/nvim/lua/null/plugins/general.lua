return {
  { "tpope/vim-sleuth" },
  { "grafana/vim-alloy" },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        icons_enabled = true,
        theme = "rose-pine",
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
    cond = false,
    priority = 412049,
    config = function()
      require("tokyonight").setup({ style = "moon" })
      vim.cmd.colorscheme("tokyonight")
    end,
  },

  {
    "rose-pine/neovim",
    priority = 412049,
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        variant = "moon",
        styles = {
          bold = false,
          italic = false,
          transparency = false,
        },
      })
      vim.cmd.colorscheme("rose-pine")
    end,
  },

  { "nvim-lua/plenary.nvim", lazy = true },

  { "windwp/nvim-autopairs", enabled = false, event = "InsertEnter", config = true },

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
