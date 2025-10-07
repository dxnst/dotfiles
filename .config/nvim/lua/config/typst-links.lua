-- Custom Typst link helpers
local M = {}

-- Insert a related note entry
M.insert_related_note = function()
    local snacks_picker = require("snacks.picker")
    snacks_picker.pick("files", {
        prompt = "Select note to add as related",
        matcher = { fuzzy = true },
        -- Filter out .zk/** using a transform
        transform = function(item)
            if item.file and string.find(item.file, "/.zk/") then
                return false
            end
            return true
        end,
        confirm = function(picker, item)
            picker:close()
            if item and item.file then
                local filename = vim.fn.fnamemodify(item.file, ":t")
                local note_id = filename:match("^([^%-]+)")
                local title = filename:match("^[^%-]+-(.+)%.typ$")
                if note_id and title then
                    title = title:gsub("%-", " ")
                    title = title:gsub("(%a)([%w_']*)", function(first, rest)
                        return first:upper() .. rest
                    end)
                    local entry = string.format('  (id: "%s", title: "%s"),', note_id, title)
                    vim.api.nvim_put({ entry }, "l", true, true)
                end
            end
        end,
    })
end

return M
