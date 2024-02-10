return {
  -- indent guides for Neovim
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "VeryLazy",
    dependencies = { "mini.indentscope" },
    opts = {
      indent = {
        char = "▏",
        tab_char = "▏",
      },
      scope = { enabled = false },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    },
  },

  {
    "echasnovski/mini.indentscope",
    version = "*",
    event = "VeryLazy",
    config = function()
      local indentscope = require("mini.indentscope")
      indentscope.setup({
        symbol = "▏",
        options = { try_as_border = true },
        draw = {
          delay = 0,
          animation = indentscope.gen_animation.none(),
        },
      })
    end,
  },
}
