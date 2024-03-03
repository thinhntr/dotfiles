return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      enabled = vim.fn.executable("make") == 1,
    },
  },
  opts = function()
    local grep_args = require("telescope.config").values.vimgrep_arguments
    vim.list_extend(grep_args, { "--hidden", "-g=!.git" })
    return grep_args
  end,
  keys = {
    {
      "<leader>ff",
      function()
        vim.cmd.Telescope("find_files")
      end,
      mode = { "n" },
      desc = "Find files",
    },
    {
      "<leader>fa",
      function()
        vim.cmd.Telescope("find_files", "follow=true", "no_ignore=true", "hidden=true")
      end,
      mode = { "n" },
      desc = "Find files including hidden",
    },
    {
      "<leader>fg",
      function()
        vim.cmd.Telescope("git_files")
      end,
      mode = { "n" },
      desc = "Fuzzy search through the output of git ls-files command, respects .gitignore",
    },
    {
      "<leader>fw",
      function()
        vim.cmd.Telescope("live_grep")
      end,
      mode = { "n" },
      desc = "Live grep",
    },
    {
      "<leader>fb",
      function()
        vim.cmd.Telescope("buffers")
      end,
      mode = { "n" },
      desc = "Find buffers",
    },
    {
      "<leader>fh",
      function()
        vim.cmd.Telescope("help_tags")
      end,
      mode = { "n" },
      desc = "Help tags",
    },
    {
      "<leader>fz",
      function()
        vim.cmd.Telescope("current_buffer_fuzzy_find")
      end,
      mode = { "n" },
      desc = "Current buffer fuzzy find"
    },
  },
}
