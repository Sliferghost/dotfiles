return {
	cmd = {
		"vscode-json-language-server",
		"--stdio",
	},
	filetypes = {
		"json",
	},
	root_markers = {
		".git",
		".json",
	},
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
		},
	},
}
