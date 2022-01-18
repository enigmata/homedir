
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
  use 'nvim-lua/plenary.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'wbthomason/packer.nvim'
  use 'EdenEast/nightfox.nvim'
  use {'nvim-treesitter/nvim-treesitter', run=':TSUpdate'}
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'kyazdani42/nvim-tree.lua'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'nvim-telescope/telescope.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run='make'}
  use 'famiu/bufdelete.nvim'
  use 'akinsho/bufferline.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'folke/which-key.nvim'
  use {'numToStr/Comment.nvim', config=function() require('Comment').setup() end}
end)

