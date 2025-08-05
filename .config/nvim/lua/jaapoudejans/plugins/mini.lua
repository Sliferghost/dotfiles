return {
    {"echasnovski/mini.nvim", version = "*" },
    {
        'echasnovski/mini.files',
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local MiniFiles = require("mini.files")
            MiniFiles.setup({
                mappings = {
                    go_in = "l",
                    go_in_plus = "<CR>",
                    go_out = "h",
                    go_out_plus = "-",
                },
                options = {
                    use_as_default_explorer = true,
                },
            })
            vim.keymap.set("n", "<leader>ee", "<cmd>lua MiniFiles.open()<CR>", { desc = "Toggle mini file explorer" })
            vim.keymap.set("n", "<leader>ef", function()
                MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
                MiniFiles.reveal_cwd()
            end, { desc = "Toggle into currently opened file" })
        end,
    },
}
