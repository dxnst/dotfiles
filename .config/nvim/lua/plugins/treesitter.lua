return {
    "nvim-treesitter/nvim-treesitter",
	lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "go", "gomod", "gowork", "gosum", "html", "latex", "lua",
				"make", "python", "rust", "typst"
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
