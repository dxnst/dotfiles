-- General settings

-- Basic navigation and editing
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- Load custom Typst helpers
local typst_links = require("config.typst-links")
vim.keymap.set("n", "<leader>zi", typst_links.insert_note_id, { desc = "Insert note [I]D" })
vim.keymap.set("n", "<leader>zr", typst_links.insert_related_note, { desc = "Insert [R]elated note entry" })

