return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
        },
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        },
	    config = function()
	      require("mason").setup()

          local capabilities = require("cmp_nvim_lsp").default_capabilities()
          local lspconfig = require("lspconfig")
          require("mason-lspconfig").setup({
              automatic_installation = false,
              ensure_installed = {
                  "lua_ls",
                  "eslint",
              }
          })

          lspconfig.lua_ls.setup({
              capabilities = capabilities,
              filetypes = { "lua" },
          })

          lspconfig.csharp_ls.setup({
              capabilities = capabilities,
              filetypes = { "cs" },
          })

          lspconfig.gopls.setup({
              capabilities = capabilities,
              filetypes = { "go" },
          })

          lspconfig.clangd.setup({
              cmd = {
                "clangd",
                "--pretty",
                "--header-insertion=iwyu",
                "--background-index",
                "--suggest-missing-includes",
                "-j=12",
                "--pch-storage=memory",
                "--clang-tidy",
                "--compile-commands-dir=.",
            },
            filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
          })
	    end
    }
}
