return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
    },
    lazy = true,
    event = "BufReadPre",
    config = function()

        vim.lsp.enable({
            "clangd",
            "rust-analyzer",
        })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

        local on_attach = function(_, bufnr)
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })

            local opts = { silent = true, buffer = bufnr, noremap = true }
            vim.keymap.set("n", "<leader>li", vim.lsp.buf.hover, opts)
        end

        vim.lsp.config("*", {
            capabilities = capabilities,
            on_attach = on_attach,
        })

        vim.diagnostic.config({
            virtual_text = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
        })
    end,
}
