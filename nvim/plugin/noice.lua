vim.pack.add({ 
    { src = "https://github.com/folke/noice.nvim" },
    { src = "https://github.com/MunifTanjim/nui.nvim" }
})

 require("noice").setup({
    messages = {
        view = "mini",
    },
    views = {
        cmdline_popup = {
            position = {
                row = "25%",
                col = "50%",
            },
            border = {
                style = "none",
                padding = { 1, 2 },
            },
            filter_options = {},
            win_options = {
                winhighlight = "NormalFloat:NormalFloat, FloatBorder:FloatBorder",
            },
        },
    },
})
