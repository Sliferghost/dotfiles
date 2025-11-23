return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },

				-- Web development
				javascript = { "biome-check" },
				typescript = { "biome-check" },
				javascriptreact = { "biome-check" },
				typescriptreact = { "biome-check" },
				css = { "biome-check" },
				html = { "biome-check" },
				json = { "biome-check" },

				cpp = { "clang-format" },
				c = { "clang-format" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})
	end,
}
