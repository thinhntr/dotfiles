return {
  "tpope/vim-sleuth",

  { -- "rose-pine/neovim",
    "rose-pine/neovim",
    lazy = false,
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

  { -- "stevearc/oil.nvim",
    "stevearc/oil.nvim",
    lazy = false,
    opts = { default_file_explorer = true },
    keys = { { "n", "<leader>e", "<CMD>Oil<CR>" } },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  { -- "nvim-lualine/lualine.nvim",
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        icons_enabled = false,
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
    opts = {},
    keys = { { "<leader>gb", "<Cmd>Gitsigns toggle_current_line_blame<CR>", mode = { "n" } } },
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

  { -- "nvim-telescope/telescope.nvim"
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = "0.1.x",
  },
  -- { -- "nvim-telescope/telescope.nvim"
  --   "nvim-telescope/telescope.nvim",
  --   branch = "0.1.x",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope-live-grep-args.nvim",
  --     {
  --       "nvim-telescope/telescope-fzf-native.nvim",
  --       build = "make",
  --       enabled = vim.fn.executable("make") == 1,
  --     },
  --   },
  --   config = function()
  --     local lga_actions = require("telescope-live-grep-args.actions")
  --
  --     require("telescope").setup({
  --       extensions = {
  --         live_grep_args = {
  --           auto_quoting = true, -- enable/disable auto-quoting
  --           -- define mappings, e.g.
  --           mappings = { -- extend mappings
  --             i = {
  --               ["<C-k>"] = lga_actions.quote_prompt(),
  --               ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
  --             },
  --           },
  --           -- ... also accepts theme settings, for example:
  --           -- theme = "dropdown", -- use dropdown theme
  --           -- theme = { }, -- use own theme spec
  --           -- layout_config = { mirror=true }, -- mirror preview pane
  --         },
  --       },
  --     })
  --     pcall(require("telescope").load_extension, "fzf")
  --     pcall(require("telescope").load_extension, "live_grep_args")
  --   end,
  --   keys = function()
  --     local builtin = require("telescope.builtin")
  --     local lga = require("telescope").extensions.live_grep_args
  --
  --     return {
  --       { "<leader>ff", builtin.find_files, mode = { "n" }, desc = "Find files" },
  --       {
  --         "<leader>fa",
  --         function()
  --           builtin.find_files({ follow = true, hidden = true, no_ignore = true })
  --         end,
  --         mode = { "n" },
  --         desc = "Find files including hidden",
  --       },
  --       { "<leader>fl", lga.live_grep_args, mode = { "n" }, desc = "Find files through git ls-files" },
  --       { "<leader>fg", builtin.git_files, mode = { "n" }, desc = "Find files through git ls-files" },
  --       { "<leader>fw", builtin.live_grep, mode = { "n" }, desc = "Live grep" },
  --       { "<leader>fb", builtin.buffers, mode = { "n" }, desc = "Find buffers" },
  --       { "<leader>fh", builtin.help_tags, mode = { "n" }, desc = "Help tags" },
  --       { "<leader>fz", builtin.current_buffer_fuzzy_find, mode = { "n" }, desc = "Current buffer fuzzy find" },
  --       { "<leader>fr", builtin.resume, mode = { "n" }, desc = "Current buffer fuzzy find" },
  --     }
  --   end,
  -- },
}
