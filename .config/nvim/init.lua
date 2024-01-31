vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- enable line numbers
vim.opt.number = true

-- enable system clipboard
vim.cmd("set clipboard+=unnamedplus")

-- set autocomplete to only insert when told to
vim.opt.completeopt = noinsert,menuone,noselect

-- enable line under/around cursor
vim.opt.cursorline = true

-- don't require writing files when changin buffers
vim.opt.hidden = true

-- show find/replace preview in split window
vim.opt.inccommand = split

-- enable mouse support
vim.opt.mouse = a

-- set title of window to filename
vim.opt.title = true

-- replace tabs with spaces
vim.opt.expandtab = true

-- set autotab width to 2
vim.opt.shiftwidth = 2

-- replace <tab> key with 2 spaces
vim.opt.tabstop = 2

-- disable compatibility mode
vim.cmd("set nocompatible")

-- set leader key to <space> and disable other <space> bindings
vim.g.mapleader = " "
vim.keymap.set('n', '<SPACE>', '<Nop>')

-- initialize lazy plugin manager
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

-- download plugins
require("lazy").setup({
  -- theme
  "sainnhe/everforest",

  -- syntax highlighting, code features, etc.
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- rainbow delimiters for treesitter
  "hiphish/rainbow-delimiters.nvim",

  -- fast comment/uncomment
  {
    "numToStr/Comment.nvim",
    opts = {
      toggler = {
        line = "<Leader>\\",
        block = "<Leader>|"
      }
    },
    lazy = false,
  },

  -- sidebar file tree
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

  -- status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup()
    end,
  },

  -- auto match bracket/parenthesis/quote pairs
  "jiangmiao/auto-pairs",

  -- show colors inline
  "ap/vim-css-color",

  -- display git add/remove/blame info next to line numbers
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },

  -- write/read file as sudo
  "lambdalisue/suda.vim",

  -- preveiw markdown in browser (:MarkdownPreview to activate)
  {
    'iamcco/markdown-preview.nvim',
    config = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
})

-- set theme
vim.opt.termguicolors = true
vim.cmd([[colorscheme everforest]])
vim.opt.background = "dark"

-- open sidebar file tree with <space> e
vim.keymap.set('n', '<Leader>e', '<cmd>NvimTreeToggle<cr>')

-- clear highlighting with <space> h
vim.keymap.set('n', '<Leader>h', '<cmd>noh<cr>')

-- buffer next/prev/close keybinds
vim.keymap.set('n', '<Leader>bn', '<cmd>bnext<cr>')
vim.keymap.set('n', '<Leader>bb', '<cmd>bprevious<cr>')
vim.keymap.set('n', '<Leader>bc', '<cmd>bd<cr>')

-- vim.api.nvim_create_user_command('w!!', 'SudaWrite', {})
vim.cmd("ca w!! :SudaWrite")

-- import treesitter config from ~/.config/nvim/lua/treesitter.lua
require("treesitter")
