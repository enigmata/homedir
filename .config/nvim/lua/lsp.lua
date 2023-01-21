local lspcfg=require('lspconfig')
local null_ls=require('null-ls')

local on_attach=function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local lsp_client_capabilities = require('cmp_nvim_lsp').default_capabilities()

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
        checkThirdParty = false,
      },
      telemetry={
        enable=false,
      },
    },
  },
}

local on_attach_rust=function(client)
  require('nvim-cmp').on_attach(client)
end

lspcfg.rust_analyzer.setup({
  on_attach=on_attach,
  settings={
    ["rust-analyzer"]={
      assist={
        importGranularity="module",
        importPrefix="by_self",
      },
      cargo={
        loadOutDirsFromCheck=true
      },
      procMacro={
        enable=true
      },
    }
  }
})

null_ls.setup({
  sources={
    null_ls.builtins.formatting.stylua.with({
        extra_args = { "--config-path", vim.fn.expand("~/.config/lua/stylua.toml") },
    }),
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.rustfmt,
    null_ls.builtins.formatting.shfmt,
  },
})
