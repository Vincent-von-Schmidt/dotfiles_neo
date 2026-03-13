-- keymaps, non plugin specific

-- leader
vim.keymap.set("", "<SPACE>", "<Nop>", { silent = true, noremap = true })
vim.g.mapleader = " "
vim.g.localmapleader = " "

-- esc
vim.keymap.set({ "n", "i", "v", "c", "s" }, "<c-e>", "<ESC>", { silent = true, noremap = true })
vim.keymap.set("v", "<cr>", "<ESC>", { silent = true, noremap = true })

-- removes search highlight on esc
vim.keymap.set("n", "<ESC>", "<cmd>nohlsearch<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<c-e>", "<cmd>nohlsearch<CR>", { silent = true, noremap = true })

-- command mode
vim.keymap.set("c", "<c-h>", "<left>", { noremap = true })
vim.keymap.set("c", "<c-l>", "<right>", { noremap = true })

-- execute project -> command needs to be defined in filetype autocmd
vim.keymap.set("n", "<leader>r", ":Run<CR>", { silent = true, noremap = true })
