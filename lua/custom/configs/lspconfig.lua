--
-- LSP Servers Configuration
-- 
-- @url https://github.com/neovim/nvim-lspconfig/blo/master/doc/server_configurations.md
--

local lspconfig = require("lspconfig")
-- local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local mason_packages = vim.fn.stdpath "data" .. "/mason/packages"

local servers = {
  "html",
  "cssls",
  "jsonls",
  "tsserver",
  "azure_pipelines_ls",
  "clangd",
}

vim.api.nvim_create_autocmd("User", {
  pattern = "LspAttached",
  once = true,
  callback = vim.lsp.codelens.refresh,
})

local on_attach = function(client, bufnr)
  require("plugins.configs.lspconfig").on_attach(client, bufnr)

  -- refresh codelens when buffer enters and buffer is saved
  -- InsertLeave TextChanged
  vim.api.nvim_create_autocmd({"BufEnter", "BufWritePre"}, {
    buffer = bufnr,
    callback = vim.lsp.codelens.refresh,
  })

  -- trigger code lens
  vim.api.nvim_exec_autocmds("User", { pattern = "LspAttached"})
end

capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities
  }
end

-- @server angular-language-server
local angular_language_server_path = mason_packages .. "/angular-language-server/node_modules/.bin/ngserver"
local typescript_language_server_path = mason_packages .. "/typescript-language-server/node_modules/.bin/tsserver"
local anigular_logs_path = vim.fn.stdpath "state" .. "/angularls.log"
local node_modules_global_path = "/usr/local/lib/node_modules"

local ngls_cmd = {
  -- "node",
   angular_language_server_path,
  "--stdio",
  "--tsProbeLocations",
  typescript_language_server_path,
  "--ngProbeLocations",
  node_modules_global_path,
  "--includeCompletionsWithSnippetText",
  "--includeAutomaticOptionalChainCompletions",
  "--logToConsole",
  "--logFile",
  anigular_logs_path,
}

 lspconfig.angularls.setup {
    cmd = ngls_cmd,
    on_attach = on_attach,
    capabilities = capabilities,
    on_new_config = function(new_config, _)
        new_config.cmd = ngls_cmd
    end,
}

