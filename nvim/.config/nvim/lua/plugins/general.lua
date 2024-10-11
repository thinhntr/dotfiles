return {
  "tpope/vim-sleuth",

  { -- "stevearc/oil.nvim",
    "stevearc/oil.nvim",
    opts = {},
    keys = { { "<leader>e", "<CMD>Oil<CR>" } },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  { -- "rose-pine/neovim",
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

  { -- "nvim-lualine/lualine.nvim",
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
          "filename",
          "%=",
          {
            "harpoon2",
            indicators = { "1", "2", "3", "4", "5", "6" },
            active_indicators = { "[1]", "[2]", "[3]", "[4]", "[5]", "[6]" },
          },
        },
      },
    },
    dependencies = {
      "letieu/harpoon-lualine",
      { -- "ThePrimeagen/harpoon",
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
          local harpoon = require("harpoon")

          harpoon:setup()

          vim.keymap.set("n", "<leader>a", function()
            harpoon:list():add()
          end)
          vim.keymap.set("n", "<leader>h", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end)

          for i = 1, 6 do
            vim.keymap.set("n", "<leader>" .. i, function()
              harpoon:list():select(i)
            end)
          end
        end,
      },
    },
  },

  { -- conform - autoformat
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({ async = true, lsp_format = "fallback" })
        end,
        mode = "",
        desc = "[c]onform [f]ormat",
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        local lsp_format_opt
        if disable_filetypes[vim.bo[bufnr].filetype] then
          lsp_format_opt = "never"
        else
          lsp_format_opt = "fallback"
        end
        return {
          timeout_ms = 500,
          lsp_format = lsp_format_opt,
        }
      end,
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        javascript = { { "prettierd", "prettier" } },
        html = { { "prettierd", "prettier" } },
        yaml = { { "prettierd", "prettier" } },
        json = { { "prettierd", "prettier" } },
      },
    },
  },

  { -- "tpope/vim-fugitive",
    "tpope/vim-fugitive",
    keys = { { "<leader>gg", vim.cmd.Git, mode = { "n" }, desc = "vim-fugitive" } },
  },

  { -- "lewis6991/gitsigns.nvim",
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>gb",
        "<Cmd>Gitsigns toggle_current_line_blame<CR>",
        mode = { "n" },
        desc = "Gitsigns toggle_current_line_blame",
      },
    },
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
  },

  { -- "lukas-reineke/indent-blankline.nvim" - indent guides for Neovim
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "VeryLazy",
    dependencies = { "mini.indentscope" },
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
  },

  { -- "echasnovski/mini.indentscope",
    "echasnovski/mini.indentscope",
    version = "*",
    event = "VeryLazy",
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
}
