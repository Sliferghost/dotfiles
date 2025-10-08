return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim", branch = "master" },
			"zbirenbaum/copilot.lua",
		},
		-- build = "make tiktoken",
		config = function()
			require("CopilotChat").setup({
				model = "gpt-4.1", -- AI model to use
				temperature = 0.1, -- Lower = focused, higher = creative
				window = {
					layout = "vertical", -- 'vertical', 'horizontal', 'float'
					width = 0.45, -- 45% of screen width
				},
				auto_insert_mode = true, -- Enter insert mode when opening
			})

			vim.keymap.set("n", "<leader>co", require("CopilotChat").open, { desc = "Open GitHub Copilot Chat" })
		end,
	},
}
