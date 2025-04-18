return {
	--- nvim-lspconfig
	{
		'neovim/nvim-lspconfig',
		config = function()
			local capabilities = require('blink.cmp').get_lsp_capabilities()
			require'lspconfig'.clangd.setup{ capabilities = capabilities }
	end,
	},

	--- mason.nvim
	{
		'williamboman/mason.nvim',
		config = function()
			require('mason').setup()
		end,
	},

	--- blink-cmp
	{
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = { 'rafamadriz/friendly-snippets' },

  version = '*',
  opts = {
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = { preset = 'default' },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono'
    },
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
	}

}
