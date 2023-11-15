
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

return require('packer').startup(
	function(use)
		use 'wbthomason/packer.nvim'
		-- these should already be nvim features
		use { 'ThePrimeagen/harpoon' }
		use { 'terrortylor/nvim-comment', run = function() require('nvim_comment').setup() {} end }
		use { 'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup {} end }

		-- big brain movement / selection
		use { 'ggandor/leap.nvim' }
		use { 'wellle/targets.vim' }
		use { 'kylechui/nvim-surround' }
		use { 'michaeljsmith/vim-indent-object' }
		use { 'kana/vim-textobj-entire', requires = 'kana/vim-textobj-user' }
		use { 'kana/vim-textobj-line', requires = 'kana/vim-textobj-user' }

		-- vim like an ide
		use { 'neovim/nvim-lspconfig' } --linting
		use { 'simrat39/rust-tools.nvim' } -- rust improvements

		use { 'nvim-treesitter/nvim-treesitter' } --highlight
		use { 'nvim-treesitter/nvim-treesitter-context', requires = { 'nvim-treesitter/nvim-treesitter' } } --function name on top
		use { 'hrsh7th/nvim-cmp' } --autocompletion
		use { 'saadparwaiz1/cmp_luasnip' } -- Snippets source for nvim-cmp
		use { 'L3MON4D3/LuaSnip' } -- Snippets plugin
		use { 'hrsh7th/cmp-nvim-lsp' } -- LSP source for nvim-cmpauto
		use { 'lukas-reineke/lsp-format.nvim' } -- autorfomatting
		use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { 'nvim-lua/plenary.nvim' } } --fuzzy finder
		use { 'rcarriga/nvim-dap-ui', requires = { 'mfussenegger/nvim-dap' } } --debugging
		use { 'theHamsta/nvim-dap-virtual-text', requires = { 'mfussenegger/nvim-dap' } } -- debugging ui

		use { 'preservim/nerdtree' }
		use { 'ryanoasis/vim-devicons' }

		-- general utils
		use { 'akinsho/toggleterm.nvim', tag = '*', run = function() require('toggleterm').setup() end }

		-- aspect
		use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
		-- themes
		use { 'shaunsingh/nord.nvim' }
		use { 'rose-pine/neovim', as = 'rose-pine' }
		use { 'Mofiqul/dracula.nvim' }
		  if packer_bootstrap then
		    require('packer').sync()
		  end
	end
)
