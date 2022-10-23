require("catppuccin").setup({
    flavour = "mocha",
    integrations = {
        treesitter = true,
    },
})

vim.cmd [[colorscheme catppuccin]]
