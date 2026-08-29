vim.pack.add({ 
    { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
    { src = "https://github.com/nvim-lua/plenary.nvim" }
})

local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>ti", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { silent = true, noremap = true })
vim.keymap.set("n", "<leader>ta", function() harpoon:list():add() end, { silent = true, noremap = true })
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { silent = true, noremap = true })
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { silent = true, noremap = true })
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { silent = true, noremap = true })
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { silent = true, noremap = true })
