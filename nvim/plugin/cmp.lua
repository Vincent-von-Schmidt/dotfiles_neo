vim.pack.add({ 
    { src = "https://github.com/hrsh7th/nvim-cmp" },
    { src = "https://github.com/hrsh7th/cmp-buffer" },
    { src = "https://github.com/hrsh7th/cmp-path" },
    { src = "https://github.com/L3MON4D3/LuaSnip" },
    { src = "https://github.com/saadparwaiz1/cmp_luasnip" },
})

local luasnip = require("luasnip")
luasnip.config.setup({
    enable_autosnippets = true,
})

local cmp = require("cmp")
cmp.setup({
    experimental = {
    ghost_text = true,
},
snippet = {
    expand = function(args)
        luasnip.lsp_expand(args.body)
    end,
},
sources = {
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
    },
mapping = {
    ["<c-y>"] = cmp.mapping.confirm({ select = true }),
    ["<c-k>"] = cmp.mapping.scroll_docs(-4),
    ["<c-j>"] = cmp.mapping.scroll_docs(4),

    ["<c-n>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_next_item()
        else
            fallback()
        end
    end),

    ["<c-p>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        else
            fallback()
        end
    end),

    ["<tab>"] = cmp.mapping(function(fallback)
        if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
        else
            fallback()
        end
    end, { "i", "s" }),

    ["<s-tab>"] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
            luasnip.jump(-1)
        else
            fallback()
        end
    end, { "i", "s" }),
},
})

-- design
vim.api.nvim_set_hl(0, "Pmenu", { link = "NormalFloat", force = true })
vim.api.nvim_set_hl(0, "PmenuSel", { link = "FloatTitle", force = true })
vim.api.nvim_set_hl(0, "PmenuSel", { fg = "#191724", bg = "#31748f", bold = true })
