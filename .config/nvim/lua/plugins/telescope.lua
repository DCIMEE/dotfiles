return {
  {
    -- run `:checkhealth telescope` for dependencies
    -- <C-/> to check key bindings
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },

    config = function()
      require('telescope').setup{
        pickers = {
          find_files = {
            theme = "ivy",
          }
        },
      }

      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags)
      -- search through vim config directories
      vim.keymap.set('n', '<leader>en', function()
        require('telescope.builtin').find_files {
          cwd = vim.fn.stdpath("config")
        }
      end)

    end
  }
}
