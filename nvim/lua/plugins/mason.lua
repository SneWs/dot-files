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
              automatic_installation = true,
              ensure_installed = {
                  "lua_ls",
                  "cssls",
                  "eslint",
                  "html",
                  "jsonls",
                  "tailwindcss",
                  "yamlls",
                  "csharp_ls",
              }
          })

          lspconfig.lua_ls.setup({
              capabilities = capabilities
          })

          lspconfig.csharp_ls.setup({
              capabilities = capabilities
          })

          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

          vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

          vim.keymap.set("n", "gd", vim.lsp.buf.definition)
          vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
          vim.keymap.set("n", "gI", vim.lsp.buf.implementation)
          vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition)
          vim.keymap.set("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols)
          vim.keymap.set("n", "<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols)

	    end
    }
}
