return {
        "github/copilot.vim",
        vim.keymap.set('n', "<leader>c",
            function()
                if vim.b.copilot_enabled then
                    vim.cmd("Copilot disable")
                else
                    vim.cmd("Copilot enable")
                end
            end),
        {
            "nvim-lua/plenary.nvim",
            name = "plenary"
        },
}
