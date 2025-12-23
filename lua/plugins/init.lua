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
			},
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
		end,
		init = function()
			-- Load the colorscheme here.
			-- Like many other themes, this one has different styles, and you could load
			-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
			vim.cmd.colorscheme("catppuccin")

			-- You can configure highlights by doing something like:
			vim.cmd.hi("Comment gui=none")
		end,
	},

	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {},
	-- 	init = function()
	-- 		vim.cmd [[colorscheme tokyonight-night]]
	-- 	end
	-- },

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
			},
			check = {
				invocationStrategy = "per_workspace",
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
