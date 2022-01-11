vim.opt.timeoutlen=500
vim.g.mapleader = " "

local wk=require("which-key")

wk.setup{}
wk.register({
  ["<leader>q"]={"<cmd>qa<cr>", "Quit all"},
  ["<leader>Q"]={"<cmd>cclose<cr>", "Close QuickFix List"},
  ["<leader>n"]={"<cmd>nohl<cr>", "Remove highlight"},
  ["<leader>j"]={"<C-w>j", "Window nav down"},
  ["<leader>k"]={"<C-w>k", "Window nav up"},
  ["<leader>l"]={"<C-w>l", "Window nav right"},
  ["<leader>h"]={"<C-w>h", "Window nav left"},
  ["<leader>u"]={"<C-w>t", "Window nav upper left"},
  ["<leader>r"]={"<C-w>b", "Window nav lower right"},
  ["<leader>p"]={"<C-w>p", "Window nav previous"},
}, { mode="n" })

wk.register({
  ["<leader>j"]={ "<C-\\><C-N><C-w>j", "Window nav down"},
  ["<leader>k"]={ "<C-\\><C-N><C-w>k", "Window nav up"},
  ["<leader>l"]={ "<C-\\><C-N><C-w>l", "Window nav right"},
  ["<leader>h"]={ "<C-\\><C-N><C-w>h", "Window nav left"},
  ["<leader>ul"]={ "<C-\\><C-N><C-w>t", "Window nav upper left"},
  ["<leader>lr"]={ "<C-\\><C-N><C-w>b", "Window nav lower right"},
  ["<leader>p"]={ "<C-\\><C-N><C-w>p", "Window nav previous"},
}, { mode="t" })

wk.register({
  ["<leader>"]={
    b={
      name="buffer",
      n={"<cmd>BufferLineCycleNext<cr>", "Next buffer"},
      p={"<cmd>BufferLineCyclePrev<cr>", "Previous buffer"},
      d={"<cmd>Bdelete<cr>", "Buffer delete"},
    },
    f={
      name="file",
      b={"<cmd>Telescope buffers<cr>", "Search buffers"},
      e={"<cmd>NvimTreeToggle<cr>", "File explorer"},
      f={"<cmd>Telescope find_files<cr>", "Find file"},
      g={"<cmd>Telescope live_grep<cr>", "Grep live"},
      h={"<cmd>Telescope help_tags<cr>", "Search help"},
      n={"<cmd>enew<cr>", "New file"},
    },
    t={
      name="text",
      w={
        name="whitespace",
        s={"<cmd>set list!<cr>", "Show whitespace"},
        d={"<cmd>%s/\\\\s\\\\+$//gc<CR>", "Delete WS to EOL"},
      },
    },
    L={
      name="lsp",
      c={"<cmd>lua vim.lsp.buf.code_action()<cr>", "Select code action"},
      d={"<cmd>lua vim.lsp.buf.definition()<cr>", "Goto definition"},
      D={"<cmd>lua vim.lsp.buf.declaration()<cr>", "Goto declaration"},
      f={"<cmd>lua vim.lsp.buf.formatting()<cr>", "Format buffer"},
      h={"<cmd>lua vim.lsp.buf.hover()<cr>", "Hover"},
      i={"<cmd>lua vim.lsp.buf.implementation()<cr>", "Goto implementation"},
      r={"<cmd>lua vim.lsp.buf.rename()<cr>", "Rename symbol under cursor"},
      R={"<cmd>lua vim.lsp.buf.references()<cr>", "Show references in qflist"},
      s={"<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature help"},
      t={"<cmd>lua vim.lsp.buf.type_definition()<cr>", "Goto type definition"},
      g={
        name="diagnostics",
        l={"<cmd>lua vim.diagnostic.setloclist()<cr>", "Add buffer diagnostics to loc list"},
        n={"<cmd>lua vim.diagnostic.goto_next()<cr>", "Goto next diagnostic"},
        p={"<cmd>lua vim.diagnostic.goto_prev()<cr>", "Goto previous diagnostic"},
        w={"<cmd>lua vim.diagnostic.open_float()<cr>", "Show diagnostics in floating win"},
      },
      w={
        name="workspace",
        a={"<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", "Add workspace folder"},
        l={"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", "List workspace folders"},
        r={"<cmd>lua vim.lsp.buf.remove_workspace_folder<cr>", "Remove workspace folder"},
      },
    },
  },
})
