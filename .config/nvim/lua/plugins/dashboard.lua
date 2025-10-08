return {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
        dashboard = {
            preset = {
				keys = {
					{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
					{ icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
					{ icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
    },
                header = [[
⠀⠀⠀⠀⠀⠀⣀⣀⠀⠀⠀⠀⣤⠟⡇⠀⠀⠀⠀⠀⠀⣠⣶⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣀⣼⣿⡃⠀⠀⢀⡾⡃⠀⣿⠀⠀⠀⠀⢠⡼⠋⢸⡆⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠹⠟⠋⠁⣰⡟⣠⡇⠀⢻⡀⠀⢀⣴⠏⢀⡀⠘⣷⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣰⠟⣶⣿⡇⠠⠸⣧⣠⠟⠁⢀⣾⡇⠀⣿⠀⠀⠀⠀⠀⠀⠀
⠐⣧⡀⠀⠀⠀⣸⠏⢾⠿⣿⡇⠀⠀⠙⠃⠀⢠⣾⣿⡇⠀⣿⡆⠀⠀⢀⣀⠀⠀
⠀⠀⠙⢦⣀⡾⢿⣶⣮⣅⡀⠀⠀⠀⠀⠀⠀⠀⠙⠿⠅⠀⢹⣇⣠⠶⠛⠛⠀⠀
⠀⢠⣄⣀⣹⡇⠘⣿⣿⣿⠿⠆⠀⠒⢻⣾⣶⣶⣤⡀⠀⣠⣼⡟⠃⠀⠀⠀⠀⠀
⠀⠀⠀⢀⣸⣧⠀⠀⠀⠀⠰⡆⠀⠀⠈⠿⣿⡿⡟⠻⠞⢯⣼⣇⣀⠀⠀⠀⠀⠀
⠀⠠⡾⠛⠁⠘⠷⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡾⠁⠀⠉⠛⠶⣤⣀⡀
⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⣿⣶⣶⣶⣶⣶⣶⠶⠛⠙⢷⣄⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡟⠙⠛⠛⠛⢻⣇⠀⠀⠀⠀⠉⠳⣦⡄⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⡆⠀⢻⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⡇⠀⠀⠀⡇⠀⠀⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢀⡾⢸⠇⠀⠀⠀⣷⠀⠀⢹⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣀⣤⠴⠞⠛⠛⡆⠀⠀⠀⢸⣆⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣾⣋⢀⣀⣠⣴⣾⠇⠀⠀⣰⠟⠙⠶⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠈⠉⠉⢁⡴⠋⠀⠀⣠⡾⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣿⣤⣤⡴⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
]],
                formats = {
                    header = { "%s", hl = "SnacksDashboardHeader", align = "center" },
                },
                footer = "I must not fear. Fear is the mind-killer.\n- Frank Herbert, Dune",
            },
            sections = {
                { section = "header" },
                { footer = "I must not fear. Fear is the mind-killer.\n- Frank Herbert, Dune", align = "center" },
                { section = "keys", gap = 0, padding = 0 },
            },
        }
    }
};
