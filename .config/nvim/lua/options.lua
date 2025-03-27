-- options.lua

-- ColorScheme
vim.opt.background = 'dark'

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- Transparency background
--[=[
vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
  ]]
--]=]


-- Remember the position when last stay
vim.cmd [[
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]]


-- Netrw
-- Hit enter in the file browser to open the selected
-- file with :vsplit to the right of the browser.
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 1
-- Change directory to the current buffer when opening files.
vim.opt.autochdir = true
-- Set windows size
-- vim.g.netrw_winsize = 30
-- tree-view
vim.g.netrw_liststyle = 3
-- Keep the current directory and the browsing directory synced.
vim.g.netrw_keepdir = 0
-- Enable recursive copy of directories.
vim.g.netrw_localcopydircmd = 'cp -r'



-- For Plugins
-- vim.api.nvim_command('filetype plugin indent on')
-- vim.opt.filetype = "enable"
vim.cmd [[
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
]]


-- Interface
vim.opt.syntax = "enable"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = true
vim.opt.wrap = true
vim.opt.cursorline = true
-- vim.opt.cursorcolumn = true
vim.opt.showcmd = true
vim.opt.wildmenu = true
vim.opt.scrolloff = 5


-- Search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true


-- Tabs
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2


-- Misc.
vim.opt.compatible = false
vim.opt.hidden = true
vim.opt.updatetime = 100
vim.opt.autoindent = true
vim.opt.mouse = "a"
vim.opt.shortmess = vim.opt.shortmess + 'c'

