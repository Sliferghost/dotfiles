return {
	cmd = { "csharp-ls" },
	filetypes = { "cs", "csx" },
	-- root_dir = { ".sln", ".csproj", ".git" },
	settings = {
		csharp = {
			-- Enables powerful Roslyn analyzers for deeper code analysis. Highly recommended.
			enableRoslynAnalyzers = true,

			-- Automatically organize imports when a formatting request is made.
			organizeImportsOnFormat = true,

			-- Configuration for inlay hints (requires Neovim 0.10+).
			-- These provide helpful context like parameter names and types directly in your code.
			inlayHints = {
				enableInlayHintsForParameters = true,
				enableInlayHintsForLiteralParameters = true,
				enableInlayHintsForObjectCreationParameters = true,
				enableInlayHintsForIndexerParameters = true,
				enableInlayHintsForOtherParameters = true,
				enableInlayHintsForTypes = true,
			},
		},
	},
}
