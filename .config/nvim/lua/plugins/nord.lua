return {
	"gbprod/nord.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("nord").setup({})
		vim.cmd.colorscheme("nord")
		vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#88C0D0", bold = true })
	end
};
