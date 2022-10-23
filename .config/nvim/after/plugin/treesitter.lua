require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "go", "gomod", "python" },

    auto_install = true,

    highlight = {
        enable = true
    },

}
