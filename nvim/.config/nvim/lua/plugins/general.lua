return {
  "tpope/vim-sleuth",

  { -- "tpope/vim-fugitive",
    "tpope/vim-fugitive",
    keys = { { "<leader>gg", vim.cmd.Git, desc = "vim-fugitive" } },
  },

  { -- "lewis6991/gitsigns.nvim",
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = {},
    keys = { { "<leader>gb", "<Cmd>Gitsigns toggle_current_line_blame<CR>" } },
  },

  { -- "catppuccin/nvim",
    "catppuccin/nvim",
    lazy = false,
    priority = 412049,
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato",
        no_italic = true,
        no_bold = true,
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  { -- "stevearc/oil.nvim",
    "stevearc/oil.nvim",
    lazy = false,
    opts = { default_file_explorer = true },
    keys = { { "<leader>e", "<CMD>Oil<CR>" } },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  { -- "lukas-reineke/indent-blankline.nvim" - indent guides for Neovim
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "VeryLazy",
    opts = {
      indent = {
        char = "▏",
        tab_char = "▏",
      },
      scope = { enabled = false },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    },
    dependencies = {
      { -- "echasnovski/mini.indentscope",
        "echasnovski/mini.indentscope",
        version = "*",
        config = function()
          local indentscope = require("mini.indentscope")
          indentscope.setup({
            symbol = "▏",
            options = { try_as_border = true },
            draw = {
              delay = 0,
              animation = indentscope.gen_animation.none(),
            },
          })
        end,
      },
    },
  },
}
