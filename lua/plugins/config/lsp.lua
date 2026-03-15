local mason_lspconfig_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not mason_lspconfig_ok then
  return
end

local bind = vim.keymap.set

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  if client.server_capabilities.documentSymbolProvider then
    local navic = require('nvim-navic')
    navic.attach(client, bufnr)
  end

  require('lsp_signature').on_attach({}, bufnr)

  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  bind('n', 'gD', vim.lsp.buf.declaration, bufopts)
  bind('n', 'gd', vim.lsp.buf.definition, bufopts)
  bind('n', 'K', vim.lsp.buf.hover, bufopts)
  bind('n', 'gi', vim.lsp.buf.implementation, bufopts)
  bind('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  bind('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  bind('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  bind('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  bind('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  bind('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  bind('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  bind('n', 'gr', require('telescope.builtin').lsp_references, bufopts)
  bind('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')

if cmp_nvim_lsp_ok then
  capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
end

mason_lspconfig.setup {
  ensure_installed = {
    --[[ Language Servers ]]
    'ts_ls',
    'lua_ls',
    'jsonls',
    'yamlls',
    'html',
    'cssls',
    'pyright',
    'gopls',
    'rust_analyzer',
  }
}

if mason_lspconfig.setup_handlers then
  mason_lspconfig.setup_handlers {
    function(server_name)
      vim.lsp.config(server_name, {
        on_attach = on_attach,
        capabilities = capabilities
      })
      vim.lsp.enable(server_name)
    end
  }
else
  local servers = {
    'typescript-language-server',
    'lua_ls',
    'jsonls',
    'yamlls',
    'html',
    'cssls',
    'pyright',
    'gopls',
    'rust-analyzer',
  }
  for _, server_name in ipairs(servers) do
    vim.lsp.config(server_name, {
      on_attach = on_attach,
      capabilities = capabilities
    })
    vim.lsp.enable(server_name)
  end
end
