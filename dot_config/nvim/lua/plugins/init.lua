---@author tomkoid
---@license MIT

return {
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

	-- "gc" to comment visual regions/lines
	{ "numToStr/Comment.nvim", opts = {} },

	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {},
	},

	{
		-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000, -- Make sure to load this before all the other start plugins.
		opts = {
			flavor = "mocha", -- latte, frappe, macchiato, mocha
			transparent_background = true,
			integrations = {
				fidget = true,
				blink_pairs = true,
				nvimtree = true,
			},
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
		end,
		init = function()
			-- Load the colorscheme here.
			-- Like many other themes, this one has different styles, and you could load
			-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
			vim.cmd.colorscheme("catppuccin-mocha")

			-- You can configure highlights by doing something like:
			vim.cmd.hi("Comment gui=none")
		end,
	},

	-- {
	-- 	"ellisonleao/gruvbox.nvim",
	-- 	priority = 1000,
	-- 	config = true,
	-- 	init = function()
	-- 		vim.cmd.colorscheme("gruvbox")
	-- 	end,
	-- 	opts = {
	-- 		terminal_colors = true, -- add neovim terminal colors
	-- 		undercurl = true,
	-- 		underline = true,
	-- 		bold = true,
	-- 		italic = {
	-- 			strings = true,
	-- 			emphasis = true,
	-- 			comments = true,
	-- 			operators = false,
	-- 			folds = true,
	-- 		},
	-- 		strikethrough = true,
	-- 		invert_selection = false,
	-- 		invert_signs = false,
	-- 		invert_tabline = false,
	-- 		inverse = true, -- invert background for search, diffs, statuslines and errors
	-- 		contrast = "", -- can be "hard", "soft" or empty string
	-- 		palette_overrides = {},
	-- 		overrides = {},
	-- 		dim_inactive = false,
	-- 		transparent_mode = false,
	-- 	},
	-- },
	-- {
	-- 	"f4z3r/gruvbox-material.nvim",
	-- 	name = "gruvbox-material",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {
	-- 		italics = true, -- enable italics in general
	-- 		contrast = "hard", -- set contrast, can be any of "hard", "medium", "soft"
	-- 		comments = {
	-- 			italics = true, -- enable italic comments
	-- 		},
	-- 		background = {
	-- 			transparent = false, -- set the background to be opaque
	-- 		},
	-- 		float = {
	-- 			force_background = false, -- set to true to force backgrounds on floats even when
	-- 			-- background.transparent is set
	-- 			background_color = nil, -- set color for float backgrounds. If nil, uses the default color set
	-- 			-- by the color scheme
	-- 		},
	-- 		signs = {
	-- 			force_background = false, -- set to true to force backgrounds on signs even when
	-- 			-- background.transparent is set
	-- 			background_color = nil, -- set color for sign backgrounds. If nil, uses the default color set
	-- 			-- by the color scheme
	-- 		},
	-- 		customize = nil, -- customize the theme in any way you desire, see below what this
	-- 		-- configuration accepts
	-- 	},
	-- },
	--
	-- Highlight todo, notes, etc in comments
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				disabled_filetypes = { "NERDTree", "NvimTree_1" },
			},
		},
	},
	{ "vimwiki/vimwiki" },
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	}, -- colorize hex colors
	{
		"f-person/git-blame.nvim",
		config = function()
			require("gitblame").setup({ enabled = true })
		end,
	},
	{
		"saghen/blink.indent",
		--- @module 'blink.indent'
		--- @type blink.indent.Config
		-- opts = {},
	},
	{
		"lambdalisue/suda.vim",
	},
	-- Lazy.nvim
	{
		"hiasr/vim-zellij-navigator.nvim",
		config = function()
			require("vim-zellij-navigator").setup()
		end,
	},

	{
		"danymat/neogen",
		config = function()
			local neogen = require("neogen")

			neogen.setup({
				snippet_engine = "luasnip",
			})

			local opts = { noremap = true, silent = true }
			vim.keymap.set("n", "<leader>nc", function()
				neogen.generate({ snippet_engine = "luasnip" })
			end, opts)
		end,
	},

	-- Hightlight Rust lifetimes
	-- {
	-- 	"cordx56/rustowl",
	-- 	version = '*', -- Latest stable version
	-- 	build = 'cargo binstall rustowl',
	-- 	lazy = false, -- This plugin is already lazy
	-- 	opts = {},
	-- },

	{
		"mrcjkb/rustaceanvim",
		version = "^7", -- Recommended
		lazy = false, -- This plugin is already lazy
		opts = {
			cargo = {
				features = "all",
				allTargets = false,
			},
			check = {
				invocationStrategy = "per_workspace",
			},
			diagnostics = {
				enabled = true,
				disabled = { "inactive-code" },
			},
		},
		config = function(_, opts)
			vim.g.rustaceanvim = {
				-- Plugin configuration
				tools = {},
				-- LSP configuration
				server = {
					on_attach = function(_, _)
						-- you can also put keymaps in here
					end,
					default_settings = {
						-- rust-analyzer language server configuration
						["rust-analyzer"] = opts,
					},
				},
				-- DAP configuration
				dap = {},
			}
		end,
	},
}
