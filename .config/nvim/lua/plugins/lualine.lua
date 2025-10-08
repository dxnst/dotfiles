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

        -- Git diff colors matching Nord theme
        local colors = {
            added    = '#A3BE8C',
            modified = '#EBCB8B',
            removed  = '#BF616A',
        }

        require("lualine").setup {
            sections = {
                lualine_a = {
                    {
                        'mode',
                        fmt = function(str)
                            return str:sub(1, 1) -- Show only first letter
                        end
                    }
                },
                lualine_b = {
                    {
                        'branch',
                        icon = '',
                    },
                    {
                        'diff',
                        colored = true,
                        diff_color = {
                            added    = { fg = colors.added },
                            modified = { fg = colors.modified },
                            removed  = { fg = colors.removed },
                        },
                        symbols = { added = ' ', modified = ' ', removed = ' ' },
                    },
                },
                lualine_c = {
                    {
                        'filename',
                        path = 1, -- Relative path
                        symbols = {
                            modified = '●',
                            readonly = '',
                            unnamed = '[No Name]',
                            newfile = '',
                        }
                    },
                },
                lualine_x = {
                    {
                        'diagnostics',
                        sources = { 'nvim_diagnostic' },
                        symbols = { error = ' ', warn = ' ', info = ' ', hint = '󰌵 ' },
                    },
                    'encoding',
                },
                lualine_y = {
                    {
                        'filetype',
                        colored = true,
                        icon_only = false,
                    }
                },
                lualine_z = {
                    {
                        line_total,
                        icon = ''
                    }
                },
            },
            options = {
                theme = "nord",
                disabled_filetypes = {
                    statusline = { "alpha", "dashboard" },
                    winbar = {},
                },
                globalstatus = true, -- Single statusline for all windows
                section_separators = { left = '', right = '' },
                component_separators = { left = '│', right = '│' },
            },
            extensions = {
                "nvim-tree",
                "lazy",
                "mason",
            },
        }
    end,
};
