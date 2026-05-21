return {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"jsx",
		"tsx",
	},
	root_markers = { "package.json", "tsconfig.json", ".git" },
	settings = {
		javascript = {
			inlayHints = {
				-- Show inlay hints for parameter names in function calls.
				parameterNames = { enabled = "literals" },
				-- Show inlay hints for the types of variables and properties.
				variableTypes = { enabled = true },
				-- Show inlay hints for function return types.
				functionLikeReturnTypes = { enabled = true },
			},
			-- Automatically add imports for unresolved symbols during completion
			suggest = {
				autoImports = true,
			},
			-- Enable snippets for functions and methods in completion
			completeFunctionCalls = true,
		},
		typescript = {
			inlayHints = {
				parameterNames = { enabled = "literals" },
				variableTypes = { enabled = true },
				functionLikeReturnTypes = { enabled = true },
			},
			suggest = {
				autoImports = true,
			},
			completeFunctionCalls = true,
			-- This is a very useful setting to enable the "organize imports"
			-- feature as a source for `vim.lsp.buf.code_action()`.
			implementationsCodeLens = true,
		},
	},
}
