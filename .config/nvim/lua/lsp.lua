local lspcfg=require('lspconfig')

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local lsp_client_capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspcfg.sumneko_lua.setup {
  on_attach=on_attach,
  capabilities = lsp_client_capabilities,
  flags={
    debounce_text_changes=150,
  },
  settings={
    Lua={
      runtime={
        version='LuaJIT',
        path=runtime_path,
      },
      diagnostics={
        globals={'vim'},
      },
      workspace={
        library=vim.api.nvim_get_runtime_file("", true),
      },
      telemetry={
        enable=false,
      },
    },
  },
}
