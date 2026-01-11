return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        ---@diagnostic disable-next-line: missing-fields
        require("nvim-treesitter").setup({
            ensure_installed = {
                "latex", "lua", "make", "python", "rust", "typst"
            },
            sync_install = false,
            auto_install = true,
        })

        -- Enable treesitter-based highlighting
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "*",
            callback = function()
                pcall(vim.treesitter.start)
            end,
        })

        -- Enable treesitter-based indentation
        vim. opt.indentexpr = "v: lua.require'nvim-treesitter'.indentexpr()"
    end
}
