-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  vim.opt.termguicolors = true
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'github/copilot.vim'

  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'

  use "rebelot/kanagawa.nvim"

  use 'neovim/nvim-lspconfig'
  -- use 'jose-elias-alvarez/null-ls.nvim'
  -- use 'MunifTanjim/eslint.nvim'


  use {
	  'nvim-telescope/telescope.nvim', branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- nvim-colorizer
  use 'norcalli/nvim-colorizer.lua'
  --use 'chriskempson/base16-vim'
  --use 'morhetz/gruvbox'
 -- use 'junegunn/seoul256.vim'

  -- lukas-reineke/indent-blankline.nvim
  use { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} }


  -- lewis6991/gitsigns.nvim
  -- Gitsigns is a plugin that allows you to see git changes in the sign column and stage and undo those changes.
  -- plugins.configs.others
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }


  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      --- Uncomment these if you want to manage LSP servers from neovim
      -- {'williamboman/mason.nvim'},
      -- {'williamboman/mason-lspconfig.nvim'},

      -- LSP Support
      {'neovim/nvim-lspconfig'},
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    }
  }

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  require 'colorizer'.setup()
  -- ibl
  --require("ibl").setup {
    --char = ".",
    --buftype_exclude = {"terminal"}
  --}

  if packer_bootstrap then
    require('packer').sync()
  end
end)
