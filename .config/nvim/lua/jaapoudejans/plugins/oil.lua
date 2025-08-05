return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup({
            default_file_explorer = true, -- startup nvim with oil instead of netrw
            columns = {},
            keymaps = {
                ["<C-h>"] = false, -- prevents closing oil
                ["<C-c>"] = false, -- prevents closing oil
                ["<M-h>"] = "action.select_split",
                ["q"] = "actions.close",
            },
            delete_to_trash = true,
            view_options = {
                show_hidden = true,
            },
            skip_confirm_for_simple_edits = true,
        })

        vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open file explorer"})
        vim.keymap.set("n", "<leader>-", require("oil").toggle_float, { desc = "Show oil in a floating window"})

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "oil",
            callback = function()
                vim.opt_local.cursorline = true
            end
        })
    end
}
