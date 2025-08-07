return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters = {
				csharpier = function()
					local useDotnet = not vim.fn.executable("csharpier")

					local command = useDotnet and "dotnet csharpier" or "csharpier"

					local version_out = vim.fn.system(command .. " --version")

					local major_version = tonumber((version_out or ""):match("^(%d+)")) or 0
					local is_new = major_version >= 1

					local args = is_new and { "format", "$FILENAME" } or { "--write-stdout" }

					return {
						command = command,
						args = args,
						stdin = not is_new,
						require_cwd = false,
					}
				end,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				go = {
					"goimports",
					"golines",
					"gofumpt",
				},
				cs = { "csharpier" },
				xml = { "xmlformatter" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})
	end,
}
