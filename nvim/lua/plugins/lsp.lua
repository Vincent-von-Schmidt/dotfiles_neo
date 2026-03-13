return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
    },
    lazy = true,
    event = "BufReadPre",
    config = function()

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

        vim.lsp.enable({
            "clangd",
        })

        vim.lsp.config("*", {
            capabilities = capabilities
        })

        vim.diagnostic.config({
            virtual_text = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
        })
    end,
}
