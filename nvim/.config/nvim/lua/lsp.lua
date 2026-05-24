vim.keymap.set("n", "grd", vim.lsp.buf.definition, { desc = "Go To Definition" })

-- Lua Language Server --
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                    "${3rd}/luv/library",
                },
            },
        },
    },
})

-- Mason --
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls" },
    automatic_enable = true
})
