vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ee", vim.cmd.Ex)
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true })

-- NVIM-TREE
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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
  -- make the tree select the current file
    update_focused_file = {
      enable = true,
    },
    hijack_cursor = true,
    diagnostics = {
      enable = true,
    },
    update_cwd = true,
})

-- open on startup
--vim.cmd("NvimTreeToggle")
