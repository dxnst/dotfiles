return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = {
[[⠀⠀⠀⠀⠀⣀⣀⠀⠀⠀⠀⣤⠟⡇⠀⠀⠀⠀⠀⠀⣠⣶⠀⠀⠀⠀⠀⠀⠀⠀]],
[[⠀⠀⠀⣀⣼⣿⡃⠀⠀⢀⡾⡃⠀⣿⠀⠀⠀⠀⢠⡼⠋⢸⡆⠀⠀⠀⠀⠀⠀⠀]],
[[⠀⠀⠀⠀⠹⠟⠋⠁⣰⡟⣠⡇⠀⢻⡀⠀⢀⣴⠏⢀⡀⠘⣷⠀⠀⠀⠀⠀⠀⠀]],
[[⠀⠀⠀⠀⠀⠀⠀⣰⠟⣶⣿⡇⠠⠸⣧⣠⠟⠁⢀⣾⡇⠀⣿⠀⠀⠀⠀⠀⠀⠀]],
[[⠐⣧⡀⠀⠀⠀⣸⠏⢾⠿⣿⡇⠀⠀⠙⠃⠀⢠⣾⣿⡇⠀⣿⡆⠀⠀⢀⣀⠀⠀]],
[[⠀⠀⠙⢦⣀⡾⢿⣶⣮⣅⡀⠀⠀⠀⠀⠀⠀⠀⠙⠿⠅⠀⢹⣇⣠⠶⠛⠛⠀⠀]],
[[⠀⢠⣄⣀⣹⡇⠘⣿⣿⣿⠿⠆⠀⠒⢻⣾⣶⣶⣤⡀⠀⣠⣼⡟⠃⠀⠀⠀⠀⠀]],
[[⠀⠀⠀⢀⣸⣧⠀⠀⠀⠀⠰⡆⠀⠀⠈⠿⣿⡿⡟⠻⠞⢯⣼⣇⣀⠀⠀⠀⠀⠀]],
[[⠀⠠⡾⠛⠁⠘⠷⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡾⠁⠀⠉⠛⠶⣤⣀⡀]],
[[⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⣿⣶⣶⣶⣶⣶⣶⠶⠛⠙⢷⣄⠀⠀⠀⠀⠀⠀⠀]],
[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡟⠙⠛⠛⠛⢻⣇⠀⠀⠀⠀⠉⠳⣦⡄⠀⠀⠀⠀]],
[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⡆⠀⢻⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⡇⠀⠀⠀⡇⠀⠀⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
[[⠀⠀⠀⠀⠀⠀⠀⠀⢀⡾⢸⠇⠀⠀⠀⣷⠀⠀⢹⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
[[⠀⠀⠀⠀⠀⣀⣤⠴⠞⠛⠛⡆⠀⠀⠀⢸⣆⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
[[⠀⠀⠀⠀⣾⣋⢀⣀⣠⣴⣾⠇⠀⠀⣰⠟⠙⠶⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
[[⠀⠀⠀⠀⠈⠉⠉⢁⡴⠋⠀⠀⣠⡾⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
[[⠀⠀⠀⠀⠀⠀⠀⣿⣤⣤⡴⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "   New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "󰈞   Find file", ":Telescope find_files <CR>"),
      dashboard.button("q", "󰩈   Quit NVIM", ":qa<CR>"),
    }

    alpha.setup(dashboard.opts)

	dashboard.section.footer.val =
		"I must not fear. Fear is the mind-killer.\n- Frank Herbert, Dune"

    -- Disable folding on alpha buffer
	vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
  end,
}
