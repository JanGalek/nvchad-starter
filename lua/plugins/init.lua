vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        -- Zkontroluje, jestli nejsou otevřeny žádné soubory
        local is_empty = vim.fn.argc() == 0

        if is_empty then
            require("nvim-tree.api").tree.open()
        end
    end,
})

return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- file managing , picker etc
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      local defaultconf = require "nvchad.configs.nvimtree"
      local myconf = {
        filters = {
          custom = {
            '.git', '.idea'
          },
          exclude = {
            'vendor', 'node_modules', '.gitignore'
          }
        },
        git = {
          enable = true,
          ignore = false,
        },
      }

      return vim.tbl_deep_extend('force', myconf, defaultconf)
--      return require "nvchad.configs.nvimtree"
    end,
  },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
