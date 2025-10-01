-- Custom Typst link helpers
local M = {}

-- Insert a note ID reference
M.insert_note_id = function()
	require("telescope.builtin").find_files({
		cwd = vim.fn.expand("~/git-stuff/knowledge-base"),
		prompt_title = "Select note to reference",
		find_command = { "rg", "--files", "--glob", "*.typ", "--glob", "!.zk/**" },
		attach_mappings = function(prompt_bufnr, map)
			local actions = require("telescope.actions")
			local action_state = require("telescope.actions.state")
			
			actions.select_default:replace(function()
				actions.close(prompt_bufnr)
				local selection = action_state.get_selected_entry()
				if selection then
					-- Extract the note ID from filename
					local filename = vim.fn.fnamemodify(selection.value, ":t")
					local note_id = filename:match("^([^%-]+)")
					if note_id then
						-- Insert just the ID
						vim.api.nvim_put({ note_id }, "c", false, true)
					end
				end
			end)
			return true
		end,
	})
end

-- Insert a full related note entry
M.insert_related_note = function()
	require("telescope.builtin").find_files({
		cwd = vim.fn.expand("~/git-stuff/knowledge-base"),
		prompt_title = "Select note to add as related",
		find_command = { "rg", "--files", "--glob", "*.typ", "--glob", "!.zk/**" },
		attach_mappings = function(prompt_bufnr, map)
			local actions = require("telescope.actions")
			local action_state = require("telescope.actions.state")
			
			actions.select_default:replace(function()
				actions.close(prompt_bufnr)
				local selection = action_state.get_selected_entry()
				if selection then
					local filename = vim.fn.fnamemodify(selection.value, ":t")
					local note_id = filename:match("^([^%-]+)")
					local title = filename:match("^[^%-]+-(.+)%.typ$")
					
					if note_id and title then
						-- Convert dashes to spaces and capitalize
						title = title:gsub("%-", " ")
						title = title:gsub("(%a)([%w_']*)", function(first, rest)
							return first:upper() .. rest
						end)
						
						-- Insert the related note entry
						local entry = string.format('  (id: "%s", title: "%s"),', note_id, title)
						vim.api.nvim_put({ entry }, "l", true, true)
					end
				end
			end)
			return true
		end,
	})
end

return M
