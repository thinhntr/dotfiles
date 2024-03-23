return {
  {
    -- auto complete
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        -- Snippet Engine
        "L3MON4D3/LuaSnip",
        build = (function()
          if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
            return
          end
          return "make install_jsregexp"
        end)(),
        {
          "rafamadriz/friendly-snippets",
          config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
          end,
        },
      },

      -- display function signatures with the current parameter emphasized
      "hrsh7th/cmp-nvim-lsp-signature-help",
      -- cmp sources
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lua",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      luasnip.config.setup({})

      require("cmp").setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = "menu,menuone,noinsert" },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-y>"] = cmp.mapping.confirm({ select = true }),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<C-Space>"] = cmp.mapping.complete(),

          -- Snippet keymaps
          ["<C-l>"] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { "i", "s" }),
          ["<C-h>"] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }, {
          { name = "nvim_lsp_signature_help" },
        }),
        formatting = {
          format = function(_, vim_item)
            local cmp_kinds = {
              Text = "  ",
              Method = "  ",
              Function = "  ",
              Constructor = "  ",
              Field = "  ",
              Variable = "  ",
              Class = "  ",
              Interface = "  ",
              Module = "  ",
              Property = "  ",
              Unit = "  ",
              Value = "  ",
              Enum = "  ",
              Keyword = "  ",
              Snippet = "  ",
              Color = "  ",
              File = "  ",
              Reference = "  ",
              Folder = "  ",
              EnumMember = "  ",
              Constant = "  ",
              Struct = "  ",
              Event = "  ",
              Operator = "  ",
              TypeParameter = "  ",
            }
            vim_item.kind = (cmp_kinds[vim_item.kind] or "") .. vim_item.kind
            return vim_item
          end,
        },
      })
    end,
  },
}
