
---@type NvPluginSpec
local plugins = {
  -- @overide nvchad plugins
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "nvimtools/none-ls.nvim",
        config = function()
          require "custom.configs.none-ls"
        end,
      },
    },
    config = function()
      require("plugins.configs.lspconfig").defaults()
      require("custom.configs.lspconfig")
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = require "custom.configs.mason"
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "custom.configs.treesitter"
  },
}

return plugins;
