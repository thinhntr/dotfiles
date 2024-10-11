--[[
===================
|  options         |
===================
--]]

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 0 -- zero -> uses 'tabstop'
vim.opt.softtabstop = 0 -- zero -> off, negative -> uses 'shiftwidth'
vim.opt.expandtab = true

vim.opt.scrolloff = 5
vim.opt.fixeol = false
vim.opt.guicursor = ""
vim.opt.signcolumn = "yes"
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.laststatus = 3 -- all windows use the same status line
vim.opt.showmode = false -- don't show the mode, since it's already in the status line

--[[
===================
| keymaps         |
===================
--]]

vim.keymap.set("n", "Q", "<Nop>", { silent = true })
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<C-h>", "<C-w><C-w>", { desc = "Cycle through windows" })
vim.keymap.set("n", "<C-q>", "<C-w><C-q>", { desc = "Close window" })

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set({ "n", "v" }, "<leader>Y", '"+Y')

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- quickfix list
vim.keymap.set("n", "<C-j>", "<CMD>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<CMD>cprev<CR>zz")
-- location list
vim.keymap.set("n", "<M-j>", "<CMD>lnext<CR>zz")
vim.keymap.set("n", "<M-k>", "<CMD>lprev<CR>zz")

--[[
===================
| autocommands    |
===================
--]]

--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

--[[
===================
| lazy.nvim       |
===================
--]]

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = { { import = "plugins" } },
  install = { colorscheme = { "rose-pine" } },
})
