return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-live-grep-args.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      enabled = vim.fn.executable("make") == 1,
    },
  },
  config = function()
    local lga_actions = require("telescope-live-grep-args.actions")

    require("telescope").setup({
      extensions = {
        live_grep_args = {
          auto_quoting = true, -- enable/disable auto-quoting
          -- define mappings, e.g.
          mappings = { -- extend mappings
            i = {
              ["<C-k>"] = lga_actions.quote_prompt(),
              ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
            },
          },
          -- ... also accepts theme settings, for example:
          -- theme = "dropdown", -- use dropdown theme
          -- theme = { }, -- use own theme spec
          -- layout_config = { mirror=true }, -- mirror preview pane
        },
      },
    })
    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "live_grep_args")
  end,
  keys = function()
    local builtin = require("telescope.builtin")
    local lga = require("telescope").extensions.live_grep_args

    return {
      { "<leader>ff", builtin.find_files, mode = { "n" }, desc = "Find files" },
      {
        "<leader>fa",
        function()
          builtin.find_files({ follow = true, hidden = true, no_ignore = true })
        end,
        mode = { "n" },
        desc = "Find files including hidden",
      },
      { "<leader>fl", lga.live_grep_args, mode = { "n" }, desc = "Find files through git ls-files" },
      { "<leader>fg", builtin.git_files, mode = { "n" }, desc = "Find files through git ls-files" },
      { "<leader>fw", builtin.live_grep, mode = { "n" }, desc = "Live grep" },
      { "<leader>fb", builtin.buffers, mode = { "n" }, desc = "Find buffers" },
      { "<leader>fh", builtin.help_tags, mode = { "n" }, desc = "Help tags" },
      { "<leader>fz", builtin.current_buffer_fuzzy_find, mode = { "n" }, desc = "Current buffer fuzzy find" },
    }
  end,
  -- enterprise
  -- Enterprise
}
