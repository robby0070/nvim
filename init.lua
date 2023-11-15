-- it's important that this line stays at the top, because the other files
-- need to know the leader key
vim.g.mapleader = " " -- setting the leader key to space

require "plugins"
require "autocompletion"
require "treesitter"
require "_telescope"
require "toggle_term"
require "others"
require "_lualine"
require "_nvim_dap"
require "_rose_pine"
require "_neovide"
require "_harpoon"
require "_leap"
require "_nerdtree"

-- coloscheme
vim.cmd [[colorscheme dracula]]


-- tabas ftw
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = false
vim.opt.relativenumber = true

-- Create an autocommand for Haskell files to set specific options
vim.cmd[[
augroup haskell_tab_settings
  autocmd!
  autocmd FileType haskell setlocal expandtab
  autocmd FileType haskell setlocal shiftwidth=4
augroup END
]]

-- no mouse allowed !
vim.opt.mouse = ""

-- i like to see what im searching
vim.opt.hlsearch = true
vim.opt.incsearch = true
-- also who like case sensitive search anyways?
vim.opt.smartcase = true

-- make the statusbar faster
vim.opt.cmdheight = 1
vim.opt.updatetime = 50

-- forces me to keep organized
vim.opt.wrap = false
vim.opt.colorcolumn = "80"

-- to create new lines without exiting normal mode
vim.keymap.set('n', '<leader>o', 'o<ESC>')
vim.keymap.set('n', '<leader>O', 'O<ESC>')

-- save with ctrl-s
vim.keymap.set('n', '<c-s>', ':w<CR>', { silent = true })
vim.keymap.set('i', '<c-s>', '<ESC>:w<CR>a', { silent = true })

vim.keymap.set('n', '<c-S>', ':wall<CR>', { silent = true })
vim.keymap.set('i', '<c-S>', '<ESC>:wall<CR>a', { silent = true })

-- system clipboard management
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p')
vim.keymap.set({ 'n', 'v' }, '<leader>P', '"+P')
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y')

-- fast switch of panes
vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-l>', '<c-w>l')

-- handy shortcut to start find and replace
vim.keymap.set('n', 'S', ':%s/')

-- switch with the previously opened file
vim.keymap.set('n', '<leader><TAB>', '<c-6>')

-- reload config 
vim.keymap.set('n', '<leader>R', ':source $MYVIMRC<CR>')

-- set the scipt on edit as executable
vim.keymap.set('n', '<leader>x', ':!chmod +x %<CR><CR>')

-- highlight what i'm yanking
vim.cmd 'autocmd! TextYankPost * lua vim.highlight.on_yank { on_visual = false }'
