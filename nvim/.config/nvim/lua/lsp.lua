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

-- Web development --
vim.lsp.config("ts_ls", {
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
	},
	root_markers = {
		"package.json",
		"tsconfig.json",
		"jsconfig.json",
		".git",
	},
})
vim.lsp.config("eslint", {
	root_markers = {
		"eslint.config.js",
		"eslint.config.mjs",
		".eslintrc",
		".eslintrc.js",
		".eslintrc.json",
		"package.json",
	},
})

-- Rust --
vim.lsp.config("rust_analyzer", {
	settings = {
		["rust-analyzer"] = {
			cargo = {
				allFeatures = true,
			},
			check = {
				command = "clippy",
			},
		},
	},
})

-- Mason --
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "ts_ls", "eslint", "rust_analyzer" },
	automatic_enable = true,
})
require("mason-tool-installer").setup({
	ensure_installed = { "prettierd" },
})
