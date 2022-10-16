return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'catppuccin/nvim'

  use 'neovim/nvim-lspconfig'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  use 'fatih/vim-go'
end)
