return {
	"kyazdani42/nvim-tree.lua",
	config = function()
		require("nvim-tree").setup({
			sort_by = "case_sensitive",
			view = {
				width = 23,
				adaptive_size = true,
				mappings = {
					list = {},
				},
				signcolumn = "yes",
			},
			renderer = {
				indent_width=4,
				group_empty = true,
				indent_markers = {
					enable = true,
					inline_arrows = true,
					icons = {
						corner = "└",
						edge = "│",
						item = "│",
						bottom = "─",
						none = " ",
					},
				},
			},
			filters = {
				dotfiles = true,
			},
		})

		vim.api.nvim_create_autocmd("BufEnter", {
			nested = true,
			callback = function()
				if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
					vim.cmd "quit"
				end
			end
		})
	end
}
