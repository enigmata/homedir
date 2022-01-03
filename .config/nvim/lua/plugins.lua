
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local packer=require('packer')

packer.init {
  display={
    open_fn=function()
      return require("packer.util").float { border="rounded" }
    end,
  },
}

return packer.startup(function()
  local use=packer.use
  use 'wbthomason/packer.nvim'
  use {'nvim-treesitter/nvim-treesitter', run=':TSUpdate'}
  use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use {'nvim-telescope/telescope.nvim', requires={{'nvim-lua/plenary.nvim'}}
}
end)

