local ensure_installed = {
  "bash",
  "c",
  "cpp",
  "css",
  "go",
  "groovy",
  "hcl",
  "java",
  "javascript",
  "json",
  "lua",
  "python",
  "scss",
  "svelte",
  "terraform",
  "tsx",
  "typescript",
  "vimdoc",
  "yaml",
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    event = "VeryLazy",
    dependencies = "nvim-treesitter/nvim-treesitter-context",
    main = "nvim-treesitter.configs",
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = ensure_installed,
    },
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