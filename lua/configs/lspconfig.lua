-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "phpactor", "gopls", "intelephense" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

vim.g.phpactor_executable = '/home/warfacez/.local/bin/phpactor'

lspconfig.phpactor.setup {
  cmd = {"/home/warfacez/.local/bin/phpactor"},
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  init_options = {
    ["language_server_phpstan.enabled"] = true,
  }
}

lspconfig.intelephense.setup({
  cmd = { "intelephense", "--stdio" },
  filetypes = { "php" },
  settings = {
    intelephense = {
      files = {
        maxSize = 5000000, -- Nastavení maximální velikosti souborů (v bytech)
      },
    },
  },
})


-- configuring single server, example: typescript
-- lspconfig.tsserver.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
