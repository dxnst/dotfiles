return {
    "nvim-lualine/lualine.nvim",
    event = {
		"VeryLazy"
	},
    config = function()
      -- Custom statusline that shows total line number with current
      local function line_total()
        local curs = vim.api.nvim_win_get_cursor(0)
        return curs[1]
          .. "/"
          .. vim.api.nvim_buf_line_count(0)
          .. ","
          .. curs[2]
      end

		require("lualine").setup {
			sections = {
				lualine_z = {
					line_total
				},
			},
			options = {
				theme = "nord",
				disabled_filetypes = {
					"alpha",
				},
				section_separators = { left = "", right = "" },
				component_separators = { left = "·", right = "·" },
				component_separators = { left = "", right = "" },
				component_separators = { left = "┊", right = "┊" },
			},
			extensions = {
				"nvim-tree",
			},
		}
	end,
};

