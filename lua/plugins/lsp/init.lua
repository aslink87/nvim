return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- "folke/neodev.nvim",
    "b0o/schemastore.nvim",
    "mason-org/mason-lspconfig.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    inlay_hints = { enabled = false },
    servers = {
      cssls = { settings = { css = { lint = { unknownAtRules = "ignore" } } } },
      tailwindcss = { settings = { css = { lint = { unknownAtRules = "ignore" } } } },
    },
  },
}
