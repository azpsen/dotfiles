-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

-- configure treesitter
treesitter.setup({
  -- enable syntax highlighting
  highlight = { enable = true },

  -- enable indentation
  indent = { enable = true },

  -- enable incremental selection (<C-space>)
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-space>",
      node_incremental = "<C-space>",
      scope_incremental = false,
      node_decremental = "<bs>",
    },
  },

  -- ensure these language parsers are installed
  ensure_installed = {
    "json",
    "javascript",
    "typescript",
    "tsx",
    "yaml",
    "html",
    "css",
    "markdown",
    "markdown_inline",
    "bash",
    "lua",
    "vim",
    "python",
    "rasi",
    "dockerfile",
    "printf",
    "regex",
    "sxhkdrc",
    "udev",
    "requirements",
  },
  -- auto install above language parsers
  auto_install = true,
})
