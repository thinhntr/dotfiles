-- [[ globals ]]
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.netrw_banner = 0
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- disable default providers
for _, provider in ipairs({ "python3", "ruby", "node", "perl" }) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- [[ options ]]
local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 2
opt.shiftwidth = 0
opt.softtabstop = 0
opt.expandtab = true

opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohls<CR>')

opt.scrolloff = 8
opt.breakindent = true
opt.fixendofline = false

opt.guicursor=''

opt.ignorecase = true
opt.smartcase = true

opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

opt.cursorline = true
opt.laststatus = 3

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
