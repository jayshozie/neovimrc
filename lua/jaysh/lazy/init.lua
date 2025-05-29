return {
        "github/copilot.vim",
        vim.keymap.set('n', "<leader>c",
            function()
                if vim.b.copilot_enabled then
                    vim.cmd("Copilot disable")
                    vim.b.copilot_enabled = false
                    -- print("Copilot disabled")
                    -- print("DEBUG: b.copilot_enabled = " .. tostring(vim.b.copilot_enabled))
                else
                    vim.cmd("Copilot enable")
                    vim.b.copilot_enabled = true
                    -- print("Copilot enabled")
                    -- print("DEBUG: b.copilot_enabled = " .. tostring(vim.b.copilot_enabled))
                end
            end),
        {
            "nvim-lua/plenary.nvim",
            name = "plenary"
        },
}
