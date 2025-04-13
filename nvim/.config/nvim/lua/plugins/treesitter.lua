local ts_ensure_installed = {
  "bash",
  "c",
  "cpp",
  "css",
  "go",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "vimdoc",
  "yaml",
}

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  event = "VeryLazy",
  main = "nvim-treesitter.configs",
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = ts_ensure_installed,
  },
  dependencies = { -- "nvim-treesitter/nvim-treesitter-context",
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      trim_scope = "inner",
      mode = "topline",
      max_lines = 8,
    },
  },
}
