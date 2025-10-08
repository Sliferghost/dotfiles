return {
	cmd = { "tailwindcss-language-server", "--stdio" },
	filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact" },
	root_markers = { "tailwind.config.js", "tailwind.config.ts", "package.json", ".git" },
	settings = {
		tailwindcss = {
			-- The `classAttributes` setting tells the server which attributes in your
			-- files to treat as Tailwind CSS classes.
			classAttributes = {
				"class",
				"className",
				"tw", -- For popular libraries like `twin.macro`
			},
			-- This includes support for specific frameworks or technologies.
			-- The language ID should match the filetype and a known language ID from the server.
			includeLanguages = {
				html = "html",
				css = "css",
				javascript = "javascript",
				javascriptreact = "javascriptreact",
				typescript = "typescript",
				typescriptreact = "typescriptreact",
				-- Add others like Vue, Svelte, etc. if you use them.
			},
			-- The `lint` section controls diagnostics.
			lint = {
				cssConflict = "warning",
				invalidApply = "error",
				unknownClasses = "warning",
			},
			-- You can specify the path to your Tailwind config file if it's not in the root.
			-- For most cases, this is not necessary as the server will find it.
			-- config = "path/to/your/tailwind.config.js",
		},
	},
}
