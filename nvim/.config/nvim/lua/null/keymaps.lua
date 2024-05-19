vim.keymap.set("n", "Q", "<Nop>", { silent = true })
vim.keymap.set("n", "q:", "<Nop>", { silent = true })
vim.keymap.set("n", "q!", "q:", { silent = true })
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>")

vim.keymap.set("n", "<leader>fp", "<cmd>silent !tmux neww ts<cr>")

vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")
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
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
-- location list
vim.keymap.set("n", "<M-j>", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<M-k>", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<C-h>", "<C-w><C-w>", { desc = "Cycle through windows" })
vim.keymap.set("n", "<C-q>", "<C-w><C-q>", { desc = "Close window" })
