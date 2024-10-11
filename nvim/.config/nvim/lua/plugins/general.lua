return {
  "tpope/vim-sleuth",

  { -- "rose-pine/neovim",
    "rose-pine/neovim",
    lazy = false,
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

  { -- "stevearc/oil.nvim",
    "stevearc/oil.nvim",
    lazy = false,
    opts = { default_file_explorer = true },
    keys = { { "<leader>e", "<CMD>Oil<CR>" } },
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
    event = "CursorMoved",
    config = function()
      require("conform").setup({
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
          javascript = { "prettierd", "prettier", stop_after_first = true },
          html = { "prettierd", "prettier", stop_after_first = true },
          yaml = { "prettierd", "prettier", stop_after_first = true },
          json = { "prettierd", "prettier", stop_after_first = true },
        },
      })

      vim.api.nvim_create_user_command("Format", function(args)
        local range = nil
        if args.count ~= -1 then
          local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
          range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
          }
        end
        require("conform").format({ async = true, lsp_format = "fallback", range = range })
      end, { range = true })

      vim.keymap.set("", "<leader>cf", "<CMD>Format<CR>")
    end,
  },

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

  { -- "nvim-telescope/telescope.nvim"
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { -- "nvim-telescope/telescope-fzf-native.nvim",
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
    },
    config = function()
      require("telescope").setup({})
      pcall(require("telescope").load_extension, "fzf")

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
      vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
      vim.keymap.set("n", "<leader>fs", builtin.builtin, { desc = "[F]ind [S]elect Telescope" })
      vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind current [W]ord" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
      vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
      vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[F]ind [R]esume" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind existing [b]uffers" })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set("n", "<leader>f/", function()
        builtin.live_grep({ grep_open_files = true, prompt_title = "Live Grep in Open Files" })
      end, { desc = "[F]ind [/] in Open Files" })
      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set("n", "<leader>fn", function()
        builtin.find_files({ cwd = vim.fn.stdpath("config") })
      end, { desc = "[F]ind [N]eovim files" })
    end,
  },
}
