return {
	"xiyaowong/nvim-transparent",
	config = function()
		require("transparent").setup({
			enable = true,
			extra_goups = {
				"LineNr",
			},
		})
	end
}
