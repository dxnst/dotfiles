return {
	"zk-org/zk-nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()		
		require("zk").setup({
			picker = "telescope",
			lsp = {
				auto_attach = {
					enabled = true,
					filetypes = { "typst" },
				},
				config = {
					cmd = { "zk", "lsp" },
					name = "zk",
					filetypes = { "typst" },
				},
			},
		})

		-- Helper function to get zk notebook directory
		local function get_zk_dir()
			-- Find .zk directory by searching up the directory tree
			local current_file = vim.fn.expand("%:p:h")
			while current_file ~= "/" do
				if vim.fn.isdirectory(current_file .. "/.zk") == 1 then
					return current_file
				end
				current_file = vim.fn.fnamemodify(current_file, ":h")
			end
			return vim.fn.expand("%:p:h")
		end
	end
};
