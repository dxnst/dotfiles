return {
    "nvim-treesitter/nvim-treesitter",
	lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "bibtex", "csv", "go", "gomod", "gowork", "gosum", "html",
				"latex", "lua", "make", "markdown", "markdown_inline", "python",
				"r", "rust", "typst", "zig"  
            },
            sync_install = false,
            auto_install = true,
            highlight = {
				enable = true
			},
			indent = {
                enable = true
            },
        })
    end
};
