local terminal = vim.api.nvim_create_augroup("term", { clear = true })

vim.keymap.set("n", "<leader>o", function()
	vim.api.nvim_open_win(vim.api.nvim_create_buf(false, true), true, {
		split = "right",
		win = 0,
	})
	vim.fn.termopen("bash")
end, { silent = true, noremap = true })

vim.keymap.set("n", "<leader>p", function()
	vim.api.nvim_open_win(vim.api.nvim_create_buf(false, true), true, {
		split = "below",
		win = 0,
	})
	vim.fn.termopen("bash")
end, { silent = true, noremap = true })


vim.keymap.set("n", "<leader>x", ":q!<CR>", { silent = true, noremap = true })

vim.api.nvim_create_autocmd({ "TermOpen" }, {
	group = terminal,
	callback = function()
		-- esc
		vim.keymap.set("t", "<c-e>", "<c-\\><c-n>", { silent = true, noremap = true })
		vim.cmd("startinsert")
	end,
})

-- terminal mode
vim.api.nvim_create_autocmd({ "TermOpen" }, {
	group = terminal,
	callback = function()
		vim.cmd([[

            setlocal nonumber
            setlocal norelativenumber

        ]])
	end,
})
