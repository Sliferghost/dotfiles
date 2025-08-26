return {
	cmd = { "vscode-json-language-server", "--stdio" },
	filetypes = { "json", "jsonc" },
	root_markers = { "package.json", ".git" },
	settings = (function()
		local ok, schemastore = pcall(require, "schemastore")
		return {
			json = {
				schemas = ok and schemastore.json.schemas() or {},
				validate = { enable = true },
			},
		}
	end)(),
}
