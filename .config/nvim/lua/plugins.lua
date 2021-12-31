
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
  use 'wbthomason/packer.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run=':TSUpdate' }
  use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'
end)

