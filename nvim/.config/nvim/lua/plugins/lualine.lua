return { -- "nvim-lualine/lualine.nvim",
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function()
    local opts = {
      options = {
        icons_enabled = false,
        theme = "catppuccin",
        component_separators = "",
        section_separators = "",
      },
      sections = {
        lualine_c = {
          "filename",
          "%=",
          { "harpoon2", indicators = {}, active_indicators = {} },
        },
      },
    }

    local harpoon = require("harpoon")
    harpoon:setup()
    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
    end)
    vim.keymap.set("n", "<leader>h", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    for i = 1, 9 do
      vim.keymap.set("n", "<leader>" .. i, function()
        harpoon:list():select(i)
      end)
      table.insert(opts.sections.lualine_c[3].indicators, "" .. i)
      table.insert(
        opts.sections.lualine_c[3].active_indicators,
        "[" .. i .. "]"
      )
    end

    require("lualine").setup(opts)
  end,
  dependencies = {
    "letieu/harpoon-lualine",
    { -- "ThePrimeagen/harpoon",
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
  },
}
