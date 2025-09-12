return {
	"zk-org/zk-nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		
		-- Define the LSP server explicitly via lspconfig
		lspconfig.zk.setup({
			cmd = { "zk", "lsp" },
			name = "zk",
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				-- Set up key mappings or other buffer-specific configurations here if needed
				vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
			end,
		})
		
		-- Set up zk-nvim with auto-attach disabled (handle it via lspconfig)
		require("zk").setup({
			picker = "telescope",
			lsp = {
				-- Disable the automatic LSP setup from zk-nvim
				auto_attach = {
					enabled = false,
				},
				config = {
					cmd = { "zk", "lsp" },
					name = "zk",
				},
			},
		})

		-- Keymaps for zk.commands
		vim.keymap.set("n", "<leader>zn", function()
			require("zk.commands").get("ZkNotes")()
		end, {
			desc = "Open [Z]k [N]otes"
		})
		vim.keymap.set("n", "<leader>zl", function()
			require("zk.commands").get("ZkInsertLink")()
		end, {
			desc = "Insert [Z]k [L]ink"
		})
		vim.keymap.set("n", "<leader>zk", function()
			require("zk.commands").get("ZkNew")()
		end, {
			desc = "Create new [Z]ettel[K]asten note"
			})
	end
};
