---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "onedark",

  telescope = {
    style = "bordered"
  },

  tabufline = {
    show_numbers = true,
  },

  lsp = {
    semantic_tokens = true,
  },
}

-- @extend with custom plugins for nvchad
M.plugins = "custom.plugins"

return M
