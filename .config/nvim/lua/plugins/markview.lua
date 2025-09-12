return {
    "OXY2DEV/markview.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        preview = {
            icon_provider = "devicons",
        },
        experimental = {
            check_rtp = false  -- Disable the runtime path check entirely
        }
    }
};
