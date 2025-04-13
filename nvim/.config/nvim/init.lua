vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

--[[
===================
|  options         |
===================
--]]

vim.o.number = true
vim.o.relativenumber = true

vim.o.tabstop = 4
vim.o.shiftwidth = 0 -- zero -> uses 'tabstop'
vim.o.softtabstop = 0 -- zero -> off, negative -> uses 'shiftwidth'
vim.o.expandtab = true

vim.o.list = true
vim.o.listchars = "tab:» ,trail:·,nbsp:␣"

vim.o.laststatus = 3 -- all windows use the same status line
vim.o.showmode = false -- don't show the mode, it's in the status line

vim.o.scrolloff = 5
vim.o.fixeol = false
vim.o.guicursor = ""
vim.o.signcolumn = "yes"
vim.o.colorcolumn = "80"
vim.o.cursorline = true
vim.o.wrap = false
vim.o.confirm = true -- confirm on save
vim.o.timeoutlen = 500 -- decrease mapped sequence wait time
vim.o.splitright = true
vim.o.splitbelow = false

--[[
===================
| keymaps         |
===================
--]]

vim.keymap.set("n", "Q", "<Nop>", { silent = true })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<C-h>", "<C-w><C-w>", { desc = "Cycle through windows" })
vim.keymap.set("n", "<C-q>", "<C-w><C-q>", { desc = "Close window" })

vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set({ "n", "v" }, "<leader>Y", '"+Y')

-- execute stuff
vim.keymap.set(
  "n",
  "<leader>xc",
  "<CMD>w<CR><CMD>!chmod +x %:p<CR>",
  { desc = "chmod +x current file" }
)
vim.keymap.set(
  "v",
  "<leader>xx",
  "y:let @9=substitute(@0, '\\\\*\\n', ' ', 'g')<CR>:!<C-r>9",
  { desc = "execute highlighted text" }
)

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
  group = vim.api.nvim_create_augroup(
    "kickstart-highlight-yank",
    { clear = true }
  ),
  callback = function()
    vim.hl.on_yank()
  end,
})

--[[
===================
| diagnostic      |
===================
--]]
vim.diagnostic.config({
  severity_sort = true,
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = vim.g.have_nerd_font and {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
  } or {},
  virtual_text = {
    source = "if_many",
    spacing = 2,
    format = function(diagnostic)
      local diagnostic_message = {
        [vim.diagnostic.severity.ERROR] = diagnostic.message,
        [vim.diagnostic.severity.WARN] = diagnostic.message,
        [vim.diagnostic.severity.INFO] = diagnostic.message,
        [vim.diagnostic.severity.HINT] = diagnostic.message,
      }
      return diagnostic_message[diagnostic.severity]
    end,
  },
})

vim.keymap.set(
  "n",
  "<leader>qq",
  vim.diagnostic.setloclist,
  { desc = "Open diagnostic [Q]uickfix list" }
)

vim.keymap.set("n", "<leader>qv", function()
  if vim.diagnostic.config().virtual_lines then
    vim.diagnostic.config({ virtual_lines = false })
    vim.notify("diagnostic virtual lines disabled")
  else
    vim.diagnostic.config({ virtual_lines = { current_line = true } })
    vim.notify("diagnostic virtual lines enabled")
  end
end, { desc = "Toggle virtual lines" })

--[[
===================
| lazy.nvim       |
===================
--]]

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })
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
  install = { colorscheme = { "catppuccin" } },
})
