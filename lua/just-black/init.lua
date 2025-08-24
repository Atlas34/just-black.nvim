local M = {}

--- @param options {Variant?: string, Transparent?: boolean}|nil
M.setup = function(options)
  local theme = require("just-black.theme")
  options = options or {}
  ---@type {Variant?: string, Transparent?: boolean}
  local config = {
    Transparent = false,
    Variant = "dark",
  }

  config = vim.tbl_deep_extend("force", config, options) -- 🧬 Merge user config with defaults

  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  if config.Variant == "dark" then
    vim.o.background = "dark"
  else
    vim.o.background = "light"
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "just-black"

  theme.setup(config.Variant)
  theme.set_highlights(config.Transparent)
  if config.Transparent == true then
    vim.cmd([[
    highlight Normal guibg=none
    highlight NonText guibg=none
    highlight Normal ctermbg=none
    highlight NonText ctermbg=none
  ]])
  end
end

return M
