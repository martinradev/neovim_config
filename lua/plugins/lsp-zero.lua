return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local lsp = require("lsp-zero")

      lsp.preset("recommended")

      -- Mason setup
      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = {
          "rust_analyzer",
          "clangd",
          "pyright",
          "lua_ls",
        },
        handlers = {
          lsp.default_setup,
        },
      })

      -- Custom on_attach
      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({ buffer = bufnr })
      end)

      -- Manual LSP setup (optional, for overrides)
      vim.lsp.enable("pyright")
      vim.lsp.enable("rust_analyzer")
      vim.lsp.enable("clangd")
      vim.lsp.enable("lua_ls")

      -- CMP setup
      local cmp = require("cmp")
      cmp.setup({
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        preselect = true,
        mapping = {
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<C-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_prev_item({ behavior = "insert" })
            else
              cmp.complete()
            end
          end),
        },
      })

      lsp.setup()
    end,
  },
}

