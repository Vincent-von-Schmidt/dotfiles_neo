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
            "lua-language-server",
            "haskell-language-server",
        })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

        local on_attach = function(_, bufnr)
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })

            -- lsp specific keymaps
            local opts = { silent = true, buffer = bufnr, noremap = true }
            vim.keymap.set("n", "<leader>li", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "<leader>ln", vim.lsp.buf.rename, opts)
            vim.keymap.set("n", "<leader>ld", vim.lsp.buf.type_definition, opts)
            vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, opts)
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
