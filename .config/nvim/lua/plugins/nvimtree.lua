vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

return {
	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 30,
				side = "right"
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = true,
			},
		},
	},
}
