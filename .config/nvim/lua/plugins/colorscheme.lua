return {
	{
		'ellisonleao/gruvbox.nvim', 
		priority = 1000, 
		config = true,
		lazy = false,
		config = function()
			-- load the color scheme here
			vim.cmd([[colorscheme gruvbox]])
		end,
	},
}
