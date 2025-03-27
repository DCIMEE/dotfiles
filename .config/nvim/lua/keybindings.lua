-- keybindings.lua

-- mode: i - insert mode, v - visual mode, n - normal mode
-- lhs: key
-- rhs: value
-- need a map method to handle the different kinds of key maps
local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend('force', options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, opts)
end


-- Use space as the leader key
vim.g.mapleader = ' '



-- ## Navigation
-- Baisc Cursor Move
-- noremap & map without any letter before it, use mode: ' '

map('', 'n', 'h')
map('', 'e', 'j')
map('', 'i', 'l')
map('', 'u', 'k')
map('', 'U', '5k')
map('', 'E', '5j')

-- N key: go to the start of the line
map('', 'N', '0', { silent = true })

-- I key: go to the end of the line
map('', 'I', '$', { silent = true })

-- Faster in-line navigate
map('', 'W', '5w')
map('', 'B', '5b')

-- set h (same as n, cursor left) to 'end of word'
map('', 'h', 'e')

map('', '=', 'nzz')
map('', '-', 'Nzz')
map('', '<LEADER><CR>', ':nohlsearch<CR>')


map('', 'k', 'i')
map('', 'K', 'I')
map('', 'l', 'u')


map('', 's', '<nop>')
map('', 'S', ':w<CR>')
map('', 'Q', ':q<CR>')


-- Copy to system clipboard
map('v', 'Y', '"+y')

-- Edit init.lua
map('n', '<LEADER>rc', ':e $HOME/.config/nvim/init.lua<CR>')



-- ## Split

map('', 'si', ':set splitright<CR>:vsplit<CR>')
map('', 'sn', ':set nosplitright<CR>:vsplit<CR>')
map('', 'su', ':set nosplitbelow<CR>:split<CR>')
map('', 'se', ':set splitbelow<CR>:split<CR>')


-- Change layout, Vertical or Horizontal
map('', 'sv', '<C-w>t<C-w>H')
map('', 'sh', '<C-w>t<C-w>K')

-- Cursor Move Between Split
map('', '<LEADER>i', '<C-w>l')
map('', '<LEADER>u', '<C-w>k')
map('', '<LEADER>n', '<C-w>h')
map('', '<LEADER>e', '<C-w>j')


map('', '<up>', ':res -5<CR>')
map('', '<down>', ':res +5<CR>')
map('', '<left>', ':vertical resize +5<CR>')
map('', '<right>', ':vertical resize -5<CR>')


-- TAB
map('', 'tu', ':tabe<CR>')
map('', 'tn', ':-tabnext<CR>')
map('', 'ti', ':+tabnext<CR>')

-- Misc.
map('', 'R', ':source $MYVIMRC<CR>')

-- Split a terminal on the right side
map('', 'tm', ':set splitright<CR>:vsplit<CR>:term<CR>')
map('t', '<ESC>', '<C-\\><C-n><CR>')


-- ## Netrw
-- `:Ex` to call netrw explorer
-- Toogle netrw with `Ctrl-t`
-- map('i', '<C-t>', '<Esc>:Lexplore<CR>:vertical resize 30<CR>')
-- map('n', '<C-t>', '<Esc>:Lexplore<CR>:vertical resize 30<CR>')
-- Open file, but keep focus in Explorer
-- vim.cmd('autocmd filetype netrw nmap <c-a> <cr>:wincmd W<cr>')

vim.cmd[[
augroup netrw_mapping
    autocmd!
    autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
		" Navigation up and down
    noremap <buffer> u k
    noremap <buffer> U 5k
    noremap <buffer> e j
    noremap <buffer> E 5j

endfunction
]]


-- oil.nvim
map('n', '<C-t>', ':set nosplitright<CR>:vsplit<CR><Esc>:Oil<CR>:vertical resize 30<CR>')
map('i', '<C-t>', '<ESC>:set nosplitright<CR>:vsplit<CR><Esc>:Oil<CR>:vertical resize 30<CR>')
