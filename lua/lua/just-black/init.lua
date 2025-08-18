local M = {}

vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
  vim.cmd('syntax reset')
end

---@type {Black?: string, Transparent?: string}
M.styles = {}

vim.o.background = 'dark'
vim.o.termguicolors = true
vim.g.colors_name = 'just-black'

local theme = require('just-black.theme')

if M.styles == "Transparent" then
  theme.set_highlights(true)
  vim.cmd [[
    highlight Normal guibg=none
    highlight NonText guibg=none
    highlight Normal ctermbg=none
    highlight NonText ctermbg=none
  ]]
else
  theme.set_highlights(false)
end
