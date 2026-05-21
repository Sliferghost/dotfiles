return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "storm", -- The theme comes in three styles, `storm`, `night`, and `moon`.
			light_style = "day", -- The theme is used when `background` is set to "light"

			-- THIS IS THE KEY SETTING
			transparent = true, -- Enable this to disable setting the background color

			terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim

			on_highlights = function(hl, c)
				-- To make all floating windows transparent
				hl.NormalFloat = {
					bg = "none",
				}
				hl.FloatBorder = {
					bg = "none",
				}
				-- To make the popup menu transparent
				hl.Pmenu = {
					bg = "none",
				}
				hl.PmenuSel = {
					bg = c.bg_highlight, -- Use a highlight color for the selected item
				}
			end,
			styles = {
				-- Style to be applied to different syntax groups
				-- Value is any valid Vim highlight group argument, see `:h synIDattr`
				comments = { italic = true },
				keywords = { italic = true },
				functions = {},
				variables = {},
				sidebars = "transparent",
				floats = "transparent", -- Force floats to be transparent
			},
		},
	},
}
