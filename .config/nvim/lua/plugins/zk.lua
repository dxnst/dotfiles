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
					enabled = false,
				},
				config = {
					cmd = { "zk", "lsp" },
					name = "zk",
					filetypes = { "typst" },
				},
			},
		})

		-- Keymaps for zk.commands
		vim.keymap.set("n", "<leader>zn", function()
			require("zk.commands").get("ZkNotes")()
		end, { desc = "Open [Z]k [N]otes" })
		vim.keymap.set("n", "<leader>zl", function()
			require("zk.commands").get("ZkInsertLink")()
		end, { desc = "Insert [Z]k [L]ink" })
		vim.keymap.set("n", "<leader>zk", function()
			require("zk.commands").get("ZkNew")()
		end, { desc = "Create new [Z]ettel[K]asten note" })
	end
};
