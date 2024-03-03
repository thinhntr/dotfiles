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

opt.hlsearch = false

opt.scrolloff = 8
opt.breakindent = true
opt.fixendofline = false
