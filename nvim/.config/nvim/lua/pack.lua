vim.pack.add({
	"https://github.com/folke/tokyonight.nvim",
	"https://github.com/rafamadriz/friendly-snippets",
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/folke/noice.nvim",
	"https://github.com/rcarriga/nvim-notify",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/romus204/tree-sitter-manager.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/windwp/nvim-autopairs",
	"https://github.com/windwp/nvim-ts-autotag",
	"https://github.com/MeanderingProgrammer/render-markdown.nvim",
	"https://github.com/folke/todo-comments.nvim",
	"https://github.com/kdheepak/lazygit.nvim",
	"https://github.com/christoomey/vim-tmux-navigator",
})

-- theme --
require("tokyonight").setup({})

vim.cmd.colorscheme("tokyonight")

-- mini --
--- Icons ---
require("mini.icons").setup({
	style = "glyph", -- requires a Nerd Font
})

--- Files ---
local MiniFiles = require("mini.files")
MiniFiles.setup({
	mappings = {
		go_in = "l",
		go_in_plus = "<CR>",
		go_out = "h",
		go_out_plus = "-",
	},
	options = {
		use_as_default_explorer = true,
	},
})

vim.keymap.set("n", "<leader>ef", function()
	MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
	MiniFiles.reveal_cwd()
end, { desc = "Toggle into currently opened file" })

--- Noice & Notify ---
require("notify").setup({})
require("noice").setup({
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			-- ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
		},
	},
	views = {
		cmdline_popup = {
			position = {
				row = "50%",
				col = "50%",
			},
			size = {
				width = "40%",
				min_width = 20,
				height = "auto",
			},
			win_options = {
				-- This is a Neovim option that helps with positioning
				winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
			},
		},
	},
	-- you can enable a preset for easier configuration
	presets = {
		bottom_search = false, -- use a classic bottom cmdline for search
		command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = false, -- add a border to hover docs and signature help
	},
})

--- Surround ---
require("mini.surround").setup()

--- File picker ---
local MiniPick = require("mini.pick")
local MiniExtra = require("mini.extra")

MiniPick.setup()
MiniExtra.setup()

vim.keymap.set("n", "<leader>pf", function()
	MiniPick.builtin.files()
end, { desc = "Pick file" })
vim.keymap.set("n", "<leader>ps", function()
	MiniPick.builtin.grep({ pattern = vim.fn.expand("<cword>") })
end, { desc = "Pick by word" })
vim.keymap.set("n", "<leader>ph", function()
	MiniPick.builtin.help()
end, { desc = "Pick help" })

vim.keymap.set("n", "<leader>pd", function()
	MiniExtra.pickers.diagnostic()
end, { desc = "Pick diagnostics" })
vim.keymap.set("n", "<leader>pk", function()
	MiniExtra.pickers.keymaps()
end, { desc = "Pick keymaps" })

--- Completions ---
local MiniCompletion = require("mini.completion")
MiniCompletion.setup({
	lsp_completion = {
		auto_setup = true,
	},
})

-- Treesitter --
require("tree-sitter-manager").setup({
	auto_install = true,
})

-- LSP --
require("lsp")

-- Formatting --
local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },

		javascript = { "prettierd" },
		javascriptreact = { "prettierd" },
		typescript = { "prettierd" },
		typescriptreact = { "prettierd" },

		json = { "prettierd" },
		jsonc = { "prettierd" },
		css = { "prettierd" },
		scss = { "prettierd" },
		html = { "prettierd" },

		rust = { "rustfmt" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})

vim.keymap.set("n", "<leader>f", function()
	conform.format({
		async = true,
		lsp_format = "fallback",
	})
end, { desc = "Format file" })

-- Status line --
local mode = {
	"mode",
	fmt = function(str)
		-- return ' '
		-- displays only the first character of the mode
		return " " .. str
	end,
}

local branch = { "branch", icon = { "", color = { fg = "#A6D4DE" } }, "|" }

require("lualine").setup({
	icons_enabled = true,
	options = {
		theme = "tokyonight",
		component_separators = { left = "|", right = "|" },
		section_separators = { left = "|", right = "" },
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { branch },
		lualine_c = { "filename" },
		lualine_x = {
			{ "filetype" },
		},
	},
})

-- Auto Pairs --
require("nvim-autopairs").setup({
	check_ts = true,
	ts_config = {
		lua = { "string" },
	},
})
require("nvim-ts-autotag").setup({
	opts = {
		enable_close = true,
		enable_rename = true,
		enable_close_on_slash = true,
	},
})

-- Render markdown --
require("render-markdown").setup({})

-- TODO comments --
local todo_comments = require("todo-comments")

todo_comments.setup({
	keywords = {
		FIX = {
			icon = " ", -- icon used for the sign, and in search results
			color = "error", -- can be a hex color, or a named color (see below)
			alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
			-- signs = false, -- configure signs for some keywords individually
		},
		TODO = { icon = " ", color = "info" },
		HACK = { icon = " ", color = "warning", alt = { "DON SKIP" } },
		WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
		PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
		NOTE = { icon = " ", color = "hint", alt = { "INFO", "READ", "COLORS" } },
		TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
	},
})

vim.keymap.set("n", "]t", function()
	todo_comments.jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
	todo_comments.jump_prev()
end, { desc = "Previous todo comment" })

-- LazyGit --
vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<CR>", {
	desc = "Open LazyGit",
})
