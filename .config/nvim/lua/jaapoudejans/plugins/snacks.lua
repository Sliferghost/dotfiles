return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			quickfile = {
				enabled = true,
			},
			picker = {
				enabled = true,
				matchers = {
					frecency = true,
					cwd_bonus = true,
				},
				formatters = {
					file = {
						filename_first = false,
						filename_only = false,
						icon_width = 2,
					},
				},
				layout = {
					preset = "telescope",
					cycle = false,
				},
				layouts = {
					select = {
						preview = false,
						layout = {
							backdrop = false,
							width = 0.6,
							min_width = 80,
							height = 0.4,
							min_height = 10,
							box = "vertical",
							border = "rounded",
							title = "{title}",
							title_pos = "center",
							{ win = "input", height = 1, border = "bottom" },
							{ win = "list", border = "none" },
							{ win = "preview", title = "{preview}", width = 0.6, height = 0.4, border = "top" },
						},
					},
					telescope = {
						reverse = true, -- set to false for search bar to be on top
						layout = {
							box = "horizontal",
							backdrop = false,
							width = 0.8,
							height = 0.9,
							border = "none",
							{
								box = "vertical",
								{ win = "list", title = " Results ", title_pos = "center", border = "rounded" },
								{
									win = "input",
									height = 1,
									border = "rounded",
									title = "{title} {live} {flags}",
									title_pos = "center",
								},
							},
							{
								win = "preview",
								title = "{preview:Preview}",
								width = 0.50,
								border = "rounded",
								title_pos = "center",
							},
						},
					},
					ivy = {
						layout = {
							box = "vertical",
							backdrop = false,
							width = 0,
							height = 0.4,
							position = "bottom",
							border = "top",
							title = " {title} {live} {flags}",
							title_pos = "left",
							{ win = "input", height = 1, border = "bottom" },
							{
								box = "horizontal",
								{ win = "list", border = "none" },
								{ win = "preview", title = "{preview}", width = 0.5, border = "left" },
							},
						},
					},
				},
			},
			-- image = {
			--     enabled = true,
			--     doc = {
			--         float = true, -- show image on cursor hover
			--         inline = false, -- show image inline
			--         max_width = 50,
			--         max_height = 30,
			--         wo = {
			--             wrap = false,
			--         },
			--     },
			--     convert = {
			--         notify = true,
			--         command = "magick"
			--     },
			--     img_dirs = { "img", "images", "assets", "static", "public", "media", "attachments","Archives/All-Vault-Images/", "~/Library", "~/Downloads" },
			-- },
		},
		keys = {
			{
				"<leader>lg",
				function()
					require("snacks").lazygit()
				end,
				desc = "Lazygit",
			},
			{
				"<leader>gl",
				function()
					require("snacks").lazygit.log()
				end,
				desc = "Lazygit Logs",
			},
			{
				"<leader>rF",
				function()
					require("snacks").rename.rename_file()
				end,
				desc = "Fast Rename Current File",
			},
			{
				"<leader>bx",
				function()
					require("snacks").bufdelete()
				end,
				desc = "Delete or Close Buffer (Confirm)",
			},

			-- require("snacks") Picker
			{
				"<leader>pf",
				function()
					require("snacks").picker.files()
				end,
				desc = "Find Files",
			},
			{
				"<leader>pc",
				function()
					require("snacks").picker.files({ cwd = vim.fn.stdpath("config") })
				end,
				desc = "Find Config File",
			},
			{
				"<leader>ps",
				function()
					require("snacks").picker.grep()
				end,
				desc = "Grep Word",
			},
			{
				"<leader>pws",
				function()
					require("snacks").picker.grep_word()
				end,
				desc = "Search Visual selection or Word",
				mode = { "n", "x" },
			},
			{
				"<leader>pk",
				function()
					require("snacks").picker.keymaps({ layout = "ivy" })
				end,
				desc = "Search Keymaps",
			},

			{
				"<leader>gbr",
				function()
					require("snacks").picker.git_branches({ layout = "select" })
				end,
				desc = "Switch Git Branches",
			},
			{
				"<leader>th",
				function()
					require("snacks").picker.colorschemes({ layout = "ivy" })
				end,
				desc = "Switch Color Schemes",
			},
			{
				"<leader>ph",
				function()
					require("snacks").picker.help()
				end,
				desc = "Help Pages",
			},
		},
	},
	{
		"folke/todo-comments.nvim",
		event = { "BufReadPre", "BufNewFile" },
		optional = true,
		keys = {
			{
				"<leader>pt",
				function()
					require("snacks").picker.todo_comments()
				end,
				desc = "Todo",
			},
			{
				"<leader>pT",
				function()
					require("snacks").picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } })
				end,
				desc = "Todo/Fix/Fixme",
			},
		},
	},
}
