-- https://github.com/neovim/nvim-lspconfig
require 'lspconfig'.gopls.setup {
  cmd = {"gopls", "serve"},
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  }
}

require 'lspconfig'.pyright.setup{}
