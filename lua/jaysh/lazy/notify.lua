return {
    "rcarriga/nvim-notify",

    config = function()
        require("notify").setup({
            background_colour = "#111111",
        })
    end
}
