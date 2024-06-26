return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    event = "VeryLazy",
    dependencies = "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = {
          enable = true,
          use_languagetree = true,
        },

        indent = {
          enable = true,
        },

        ensure_installed = {
          "bash",
          "c",
          "go",
          "groovy",
          "hcl",
          "java",
          "javascript",
          "json",
          "lua",
          "python",
          "terraform",
          "vimdoc",
          "yaml",
        },
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = true,
    opts = {
      trim_scope = "inner",
      mode = "topline",
      max_lines = 8,
    },
  },
}
