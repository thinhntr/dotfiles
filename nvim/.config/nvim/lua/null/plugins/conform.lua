return {
  "stevearc/conform.nvim",
  lazy = true,
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ lsp_fallback = true })
      end,
      mode = { "n", "v" },
      desc = "conform Format",
    },
  },
  opts = {
    format = {
      timeout_ms = 3000,
      async = false,
      quiet = false,
    },
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black" },
      javascript = { {"prettierd", "prettier" }},
      yaml = { {"prettierd", "prettier" }},
      json = { {"prettierd", "prettier" }},
    },
  },
}
