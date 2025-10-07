-- Basic navigation and editing
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- zk.commands
vim.keymap.set("n", "<leader>zn", function()
    require("zk.commands").get("ZkNotes")(
        nil,
        { picker = "snacks_picker" }
    )
end, { desc = "Open [Z]k [N]otes (snacks)" })

vim.keymap.set("n", "<leader>zk", function()
    require("zk.commands").get("ZkNew")()
end, { desc = "Create new [Z]ettel[K]asten note" })

-- Custom zk.command for referencing inside typst notes
local typst_links = require("config.typst-links")
vim.keymap.set("n", "<leader>zl", typst_links.insert_related_note, { desc = "Insert [R]elated note entry" })
