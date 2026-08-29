vim.pack.add({ 
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
})

-- vim.keymap.set("n", "<leader>a", "<CMD> Telescope git_files <CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>a", "<CMD> Telescope find_files <CR>", { silent = true, noremap = true })

vim.keymap.set("n", "<leader>s", "<CMD> Telescope live_grep <CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>d", "<CMD> Telescope grep_string <CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>b", "<CMD> Telescope buffers <CR>", { silent = true, noremap = true })

local package = require("telescope")

package.setup({
    defaults = {
        mappings = {

        -- normal mode
            n = {
                ["K"] = "preview_scrolling_up",
                ["J"] = "preview_scrolling_down",
                ["<c-e>"] = "close",
                ["<ESC>"] = "close",
            },
        },
        layout_config = {
            horizontal = {
                prompt_position = "top",
            },
        },
    },
    pickers = {
        find_files = {
            hidden = true,
        },
    },
    extensions = {
        ["fzf"] = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
    },
})

-- package.load_extension("fzf")

-- highlight groups
vim.api.nvim_set_hl(0, "TelescopeNormal", { link = "NormalFloat" })
vim.api.nvim_set_hl(0, "TelescopePromptNormal", { link = "NormalFloat2" })
vim.api.nvim_set_hl(0, "TelescopeBorder", { link = "FloatBorder" })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { link = "Float2Border" })
vim.api.nvim_set_hl(0, "TelescopeTitle", { link = "TelescopeBorder" })
vim.api.nvim_set_hl(0, "TelescopePromptTitle", { link = "FLoatTitle" })
vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { link = "Float2Title" })

local telescope_autogroup = vim.api.nvim_create_augroup("Telescope", { clear = true })

-- remove cursor line in insert prompt
vim.api.nvim_create_autocmd("FileType", {
    group = telescope_autogroup,
    pattern = "TelescopePrompt",
    command = "setlocal nocursorline",
})

-- spell ui
vim.keymap.set("n", "z=", function()
    require("telescope.builtin").spell_suggest(require("telescope.themes").get_cursor({}))
end, { silent = true, noremap = true })
