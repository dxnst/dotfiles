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
			-- Fallback: use current buffer's directory
			return vim.fn.expand("%:p:h")
		end

		-- Keymaps for zk.commands
		vim.keymap.set("n", "<leader>zn", function()
			require("zk.commands").get("ZkNotes")()
		end, { desc = "Open [Z]k [N]otes" })
		vim.keymap.set("n", "<leader>zk", function()
			require("zk.commands").get("ZkNew")()
		end, { desc = "Create new [Z]ettel[K]asten note" })
			-- Insert reference to another note
		vim.keymap.set("n", "<leader>zl", function()
			local zk_dir = get_zk_dir()
			require("telescope.builtin").find_files({
				cwd = zk_dir,
				prompt_title = "Insert Note Reference",
				find_command = { "fd", "--type", "f", "--extension", "typ", "--exclude", ".zk" },
				attach_mappings = function(prompt_bufnr, map)
					local actions = require("telescope.actions")
					local action_state = require("telescope.actions.state")
					
					actions.select_default:replace(function()
						actions.close(prompt_bufnr)
						local selection = action_state.get_selected_entry()
						if selection then
							-- Extract note ID from filename
							local filename = vim.fn.fnamemodify(selection.value, ":t:r")
							local note_id = filename:match("^([^%-]+)")
							
							if note_id then
								-- Insert Typst citation reference
								local line = vim.api.nvim_win_get_cursor(0)[1]
								local col = vim.api.nvim_win_get_cursor(0)[2]
								vim.api.nvim_buf_set_text(0, line - 1, col, line - 1, col, { "@" .. note_id })
								-- Move cursor after inserted text
								vim.api.nvim_win_set_cursor(0, { line, col + #note_id + 1 })
							end
						end
					end)
					return true
				end,
			})
		end, { desc = "Insert note reference" })
	end
};
