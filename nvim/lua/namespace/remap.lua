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
    width = "20%",
  },
  actions = {
      open_file = {
        resize_window = true,
      },
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

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- open on startup
--vim.cmd("NvimTreeToggle")

-- set Ctrl+C to copy to clipboard
vim.keymap.set('v', '<C-c>', '"+y', { noremap = true })
