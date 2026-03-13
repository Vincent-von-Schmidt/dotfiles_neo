local float = require("utils.float")

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	group = vim.api.nvim_create_augroup("file open", { clear = true }),
	callback = function()
		-- substitute highlighted word
        vim.keymap.set("n", "<leader>gf", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { noremap = true })
        vim.keymap.set("n", "<leader>gl", ":.s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { noremap = true })

		-- move highlighted
		vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, noremap = true })
		vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, noremap = true })
		vim.keymap.set("v", "H", "<gv", { silent = true, noremap = true })
		vim.keymap.set("v", "L", ">gv", { silent = true, noremap = true })
	end,
})

local misc = vim.api.nvim_create_augroup("misc", { clear = true })
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
	desc = "go to last edited position on opening file",
	group = misc,
	pattern = "*",
	command = 'silent! normal! g`"zvzz',
})

-- filetypes -----------

-- -- python
-- vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
-- 	pattern = "python",
-- 	group = vim.api.nvim_create_augroup("python", { clear = true }),
-- 	callback = function()
-- 		-- execute current python file
-- 		vim.api.nvim_create_user_command("Run", function()
-- 			if vim.fn.filereadable("./main.py") then
-- 				-- if python project execute main file
-- 				float.term("python3 main.py")
-- 			else
-- 				-- if idepended file execute just the file
-- 				float.term("python3 " .. vim.fn.expand("%"))
-- 			end
-- 		end, { force = true })
-- 	end,
-- })
-- 
-- -- rust
-- vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
-- 	pattern = "rust",
-- 	group = vim.api.nvim_create_augroup("rust", { clear = true }),
-- 	callback = function()
-- 		-- execute current cargo project
-- 		vim.api.nvim_create_user_command("Run", function()
-- 			if vim.fn.filereadable("./Cargo.toml") then
-- 				-- if cargo project then execute via cargo
-- 				float.term("cargo run")
-- 			else
-- 				-- if idepended rust file compile file with rustc, execute it and remote the executable
-- 				float.term("rustc -o a.out " .. vim.fn.expand("%") .. " && ./a.out && rm a.out")
-- 			end
-- 		end, { force = true })
-- 	end,
-- })

-- lua
vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
	pattern = "lua",
	group = vim.api.nvim_create_augroup("lua", { clear = true }),
	callback = function()
		-- source current file in neovim
		vim.api.nvim_create_user_command("Run", "so", { force = true })
	end,
})

-- -- c
-- vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
-- 	pattern = "c",
-- 	group = vim.api.nvim_create_augroup("c", { clear = true }),
-- 	callback = function()
-- 		-- compile the current c file, run the binary and delete the binary
-- 		vim.api.nvim_create_user_command("Run", function()
--             if vim.fn.filereadable("./CMakeLists.txt") then
--                 float.term("cmake . && make && ./app")
--             else
--                 float.term("gcc -o a.out " .. vim.fn.expand("%") .. " && ./a.out && rm a.out")
--             end
-- 		end, { force = true })
-- 	end,
-- })
