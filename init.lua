require("post_request")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
{
	'tpope/vim-sleuth',
	'tpope/vim-fugitive',
	'tpope/vim-rhubarb',
{
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {}
  end,
},
{
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
},
{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
	    require("lualine").setup()
	end
},
{
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
}
}
)
vim.cmd[[colorscheme tokyonight-storm]]
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.api.nvim_set_keymap('n', '<Space>ot', ':NvimTreeOpen<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Space>ct', ':NvimTreeClose<CR>', {noremap = true, silent = true})

vim.opt.relativenumber = true
vim.opt.number = true


vim.api.nvim_set_option("clipboard","unnamed")
