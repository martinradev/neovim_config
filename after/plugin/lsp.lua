local lsp = require('lsp-zero')

lsp.preset("recommended")

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
	'rust_analyzer',
	'clangd',
	'pyright',
	'lua_ls',
  },
})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

local cmp = require('cmp')
cmp.setup({
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  preselect = true,
  mapping = {
      ['<Enter>'] = cmp.mapping.confirm({select = false}),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<C-Tab>'] = cmp.mapping(function()
      if cmp.visible() then
            cmp.select_prev_item({behavior = 'insert'})
          else
            cmp.complete()
          end
        end),
  }
})

require('lspconfig').pyright.setup({})
require('lspconfig').rust_analyzer.setup({})
require('lspconfig').clangd.setup({})
require('lspconfig').lua_ls.setup({})

lsp.setup()
