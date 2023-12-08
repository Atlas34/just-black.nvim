vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
  vim.cmd('syntax reset')
end

vim.o.background = 'dark'
vim.o.termguicolors = true
vim.g.colors_name = 'just-black'

local theme = require('just-black.theme')

theme.set_highlights()
