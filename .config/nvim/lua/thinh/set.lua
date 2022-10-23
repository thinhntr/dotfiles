vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hlsearch = false
vim.opt.scrolloff = 8

-- tab
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 0

-- display tab and space characters
-- vim.cmd [[set list listchars=tab:>-,space:·]]

-- remap
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ee", "<cmd>Ex<CR>", {noremap=true})
vim.keymap.set("n", "<leader>tt", "<C-w>s<C-w><C-w><C-w>10-<cmd>te<CR>i", {noremap=true})
vim.keymap.set("t", "<leader>`", "<C-\\><C-n>", {noremap=true})
