return {
  {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  --- '-' to go to the parent directory
  --- 'enter' to enter the directory
  config = function()
    require("oil").setup({}) 
  end,

  opts = {},
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  lazy = false,
  }
}
